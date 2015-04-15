require 'mysql2'

class Db
  DB_HOST = 'localhost'
  DB_NAME = 'hautelook'
  DB_PASSWORD = ''
  DB_USER = 'root'

  def initialize
  end

  def apply(filename)
    import.import filename
  end

  def audit
    foreign_keys.audit
  end

  def audit_table(table)
    raise "table '#{table} not defined for database '#{DB_NAME}'" unless table_names.include? table
    foreign_keys.audit_table table
  end

  def export
    @exporter ||= Exporter.new(DB_NAME, DB_USER)
  end

  def foreign_keys
    @foreign_keys ||= ForeignKeys.new(client, DB_NAME, DB_USER)
  end

  def import
    @importer ||= Importer.new(DB_NAME, DB_USER)
  end

  def reset
    # cmd = "mysql -u #{DB_USER}"
    cmd = "mysql"
    system "#{cmd} -e 'DROP DATABASE IF EXISTS #{DB_NAME};' --user=root"
    system "#{cmd} -e 'CREATE DATABASE #{DB_NAME};' --user=root"
    system "#{cmd} -e 'GRANT ALL PRIVILEGES ON * . * TO \"#{DB_USER}\"@\"%\";' --user=root"
    system "#{cmd} -e 'FLUSH PRIVILEGES;' --user=root"
  end

  def table_constraints
    return @table_constraints unless @table_constraints.nil?
    @table_constraints = Hash.new { |h, k| h[k] = [] }
    table_referential_constraints.each do |r|
      @table_constraints[ r['TABLE_NAME'] ] << r['REFERENCED_TABLE_NAME']
    end
    @table_constraints
  end

  def table_names
    table_constraints.keys
  end

  def table_referential_constraints
    client.query(
      "SELECT TABLE_NAME, REFERENCED_TABLE_NAME
      FROM information_schema.REFERENTIAL_CONSTRAINTS
      WHERE CONSTRAINT_SCHEMA = '#{DB_NAME}'"
    )
  end

  private
    def client
      @client ||= Mysql2::Client.new(
        host: DB_HOST, username: DB_USER, password: DB_PASSWORD, database: DB_NAME
      )
    end
end

class Exporter
  SCHEMA_ARGS = '--no-data --skip-comments --skip-triggers'
  SPROC_ARGS = '--events --no-create-db --no-create-info --no-data --routines --skip-comments --skip-opt --skip-triggers'
  TABLE_DATA_ARGS = '--no-create-db --no-create-info --skip-comments --skip-triggers'
  TABLE_TRIGGER_ARGS = '--events --no-create-db --no-create-info --no-data --skip-comments'

  def initialize(db_name, db_user)
    @cmd = "mysqldump -u#{db_user} #{db_name}"
  end

  def schema(table, filename)
    system "#{@cmd} #{SCHEMA_ARGS} #{table} > #{filename}"
  end

  def sprocs(filename)
    system "#{@cmd} #{SPROC_ARGS} > #{filename}"
  end

  def table_data(table, filename)
    system "#{@cmd} #{TABLE_DATA_ARGS} #{table} > #{filename}"
  end

  def table_triggers(table, filename)
    system "#{@cmd} #{TABLE_TRIGGER_ARGS} #{table} > #{filename}"
  end
end

class ForeignKeys
  DISABLE_ARGS = "-e 'SET GLOBAL foreign_key_checks=0;'"
  ENABLE_ARGS = "-e 'SET GLOBAL foreign_key_checks=1;'"

  def initialize(client, db_name, db_user)
    @client = client
    @db_name = db_name
    @disable_cmd = "mysql -u#{db_user} #{DISABLE_ARGS} #{db_name}"
    @enable_cmd = "mysql -u#{db_user} #{ENABLE_ARGS} #{db_name}"
  end

  def audit
    return @invalid_tables unless @invalid_tables.nil?
    @client.query("CALL ANALYZE_INVALID_FOREIGN_KEYS('#{@db_name}', '%', 'Y')")
    results = @client.query(
      "select TABLE_NAME, COLUMN_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME, INVALID_KEY_COUNT, INVALID_KEY_SQL from #{@db_name}.INVALID_FOREIGN_KEYS"
    )
    @invalid_tables = results.map do |r|
      InvalidTable.new(
        r['TABLE_NAME'],
        r['COLUMN_NAME'],
        r['REFERENCED_TABLE_NAME'],
        r['REFERENCED_COLUMN_NAME'],
        r['INVALID_KEY_COUNT'],
        r['INVALID_KEY_SQL'],
      )
    end
    @invalid_tables = Hash[@invalid_tables.map { |it| [it.table, it] }]
  end
  class InvalidTable < Struct.new(:table, :column, :referenced_table, :referenced_column, :count, :sql)
    def to_s
      "#{self.table}.#{self.column}: => #{self.referenced_table}.#{self.referenced_column} #{self.count}"
    end
  end

  def audit_table(table)
    invalid_table = audit[table]
    return true if invalid_table.nil?
    results = @client.query(invalid_table.sql)
    puts "results == #{results.first}"
  end

  def disable_check
    system @disable_cmd
  end

  def enable_check
    system @enable_cmd
  end
end

class Importer
  def initialize(db_name, db_user)
    @cmd = "mysql -u#{db_user} #{db_name}"
  end

  def import(filename)
    system "#{@cmd} < #{filename}"
  end
  alias_method :schema, :import
  alias_method :sprocs, :import
  alias_method :table_data, :import
  alias_method :table_triggers, :import
end
