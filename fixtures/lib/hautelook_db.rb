load "#{File.dirname(__FILE__)}/db.rb"
load "#{File.dirname(__FILE__)}/ordering.rb"

class HautelookDb
  def initialize(repo_dir)
    @repo_dir = repo_dir
    @table_data_dir = "#{@repo_dir}/fixtures/data"
    @schemafiles_dir = "#{@repo_dir}/schema"
    @sprocfile = "#{@repo_dir}/stored_procedures/stored_procedures.sql"
    @transformationfiles_dir = "#{repo_dir}/fixtures/transformations"
    @table_triggers_dir = "#{repo_dir}/triggers"
    @db = Db.new
  end

  def apply_transformations
    Dir.glob("#{@transformationfiles_dir}/*.sql").each do |x_file|
      raise "stored procedure import failed from #{x_file}" unless db.apply x_file
    end
  end

  def audit
    invalid_tables = db.audit
    invalid_tables.values.each do |t|
      puts t
    end
  end

  def audit_table(table)
    db.audit_table table
  end

  def export
    export_schema
    export_tables
    export_sprocs
  end

  def import
    import_schema
    import_sprocs
    import_triggers
    import_data
    apply_transformations
  end

  def import_data
    constrained_table_order.each do |t|
      data_file = table_data_filename t
      if File.exists? data_file
        raise "data import failed from #{data_file}" unless db.import.table_data data_file
      end
    end
  end

  # TODO dry out view_gp_po_header crap
  def import_schema
    db.reset
    view_gp_po_header_file = schema_filename('view_gp_po_header')
    db.foreign_keys.disable_check
    begin
      Dir.glob("#{@schemafiles_dir}/*.sql").each do |schema_file|
        next if view_gp_po_header_file == schema_file
        raise "schema import failed from #{schema_file}" unless db.import.schema schema_file
      end
      schema_file = view_gp_po_header_file
      raise "schema import failed from #{schema_file}" unless db.import.schema schema_file
    ensure
      db.foreign_keys.enable_check
    end
  end

  def import_sprocs
    raise "stored procedure import failed from #{@sprocfile}" unless db.import.sprocs @sprocfile
  end

  def import_triggers
    constrained_table_order.each do |t|
      trigger_file = table_triggers_filename t
      if File.exists? trigger_file
        raise "trigger import failed from #{trigger_file}" unless db.import.table_triggers trigger_file
      end
    end
  end

  def reset
    db.reset
  end

  private
    def constrained_table_order
      return Ordering.new(db.table_constraints).ordering
    end

    def db
      @db ||= Db.new
    end

    def export_schema
      table_names.each do |t|
        filename = schema_filename(t)
        raise "error dumping schema for table #{t} to #{filename}" unless db.export.schema(t, filename)
      end
    end

    def export_sprocs
      db.export.sprocs @sprocfile
    end

    def export_tables
      table_names.each do |t|
        filename = table_data_filename(t)
        raise "error dumping data for table #{t} to #{filename}" unless db.export.table_data(t, filename)
        filename = table_triggers_filename(t)
        raise "error dumping triggers for table #{t} to #{filename}" unless db.export.table_triggers(t, filename)
      end
    end

    def schema_filename(table)
      "#{@schemafiles_dir}/#{table}.sql"
    end

    def table_data_filename(table)
      "#{@table_data_dir}/#{table}.sql"
    end

    def table_triggers_filename(table)
      "#{@table_triggers_dir}/#{table}.sql"
    end

    def table_names
      return db.table_names
    end
end
