
class Ordering
  attr_reader :ordering

  def initialize(table_constraints)
    @visited = Hash.new { |h, k| h[k] = false }
    @ordering = []
    @table_constraints = table_constraints
    topologically_sort
  end

  private
    def topologically_sort
      @table_constraints.each do |table, references|
        references.each { |r| visit r }
        visit table 
      end
    end

    def visit(table)
      return if visited? table
      @visited[table] = true
      if @table_constraints.keys.include? table
        @table_constraints[table].each do |reference|
          visit reference
        end
      end
      @ordering << table
    end

    def visited?(table)
      @visited.include? table
    end
end
