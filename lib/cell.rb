class Cell
  
  ALL_CELL_VALUES = (1..9).to_a

  attr_accessor :name, :containers, :value

  def initialize(name, grid=nil)
    @name = name
    @containers = {}
    @grid = grid
  end

  def solved?
    @value > 0
  end

  def solve!
    if !solved?
    @value = missing_values[0] if missing_values.count == 1
    end
  end

  def missing_values
    row_values = solved_values(:row)
    column_values = solved_values(:column)
    box_values = solved_values(:box)
    ALL_CELL_VALUES - row_values - column_values - box_values
  end

  def solved_values(container)
      @grid.cells.select do |cell|
      cell.containers[container] == @containers[container]
      end.map{|cell| cell.value }
  end
end