require_relative './cell'
require_relative './cell_builder'

class Grid

  include Cell_Builder

  attr_reader :cells

  def initialize(puzzle)
    @puzzle=puzzle.chars
    create_grid
    assign_cell_values
  end

  def assign_cell_values
    value = @puzzle.to_enum
    @cells.each {|cell| cell.value = value.next.to_i}
  end


  
end