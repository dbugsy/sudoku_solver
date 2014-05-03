require_relative './cell'
require_relative './cell_builder'

class Grid

  include Cell_Builder

  attr_reader :cells, :solution

  def initialize(puzzle)
    @puzzle=puzzle.chars
    create_grid
    assign_cell_values
  end

  def assign_cell_values
    value = @puzzle.to_enum
    @cells.each {|cell| cell.value = value.next.to_i}
  end

  def solved?
    cell_values = @cells.map {|cell| cell.value }
    cell_values.all? {|value| value > 0}
  end

  def solve!
    start_point = @cells.map {|cell| cell.value}
    print "start  point = #{start_point}\n\n"
    cells.each {|cell| cell.solve!(self) }
    end_point = @cells.map {|cell| cell.value}
    print "end point = #{end_point}\n\n"
    if end_point != start_point && !self.solved?
      self.solve!
    end
    @solution = @cells.map {|cell| cell.value}.join
  end

  
end