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
    cells.each {|cell| cell.solve! }
    end_point = @cells.map {|cell| cell.value}
    if end_point != start_point && !solved?
      solve!
    elsif end_point == start_point && !solved?
      solve_hard_sudoku
    else solved?
      @solution = @cells.map(&:value).join
    end
    @solution
  end

  def solve_hard_sudoku
    blank_cell = @cells.select {|cell| cell.value == 0}.first
    blank_cell.missing_values.each do |value|
      blank_cell.value=(value)
      start_point = @cells.map {|cell| cell.value}.join
      newboard = Grid.new(start_point)
      newboard.solve!
      if newboard.solved?
        rebuild!(newboard.cells.map(&:value).join)
        return
      end
    end
  end

  def rebuild!(string)
    @cells.clear
    @puzzle = string.chars
    create_grid
    assign_cell_values
  end
end