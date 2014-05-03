class Cell
  
  ALL_CELL_VALUES = (1..9).to_a

  attr_accessor :name, :containers, :value

  def initialize(name)
    @name = name
    @containers = {}
  end

  def solved?
    @value > 0
  end

  def solve!(grid)
    if !solved?
    @value = missing_values(grid)[0] if missing_values(grid).count == 1
    end
  end

  def missing_values(grid)
    row_values = solved_values(grid, :row)
    column_values = solved_values(grid, :column)
    box_values = solved_values(grid, :box)
    ALL_CELL_VALUES - row_values - column_values - box_values
  end

  def solved_values(grid, container)
    grid.cells.select do |cell|
      cell.containers[container] == @containers[container]
      end.map{|cell| cell.value }
  end
end