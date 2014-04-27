class Cell
  
  CELL_VALUES = (1..9).to_a

  attr_accessor :name, :value, :row_values, :column_values, :box_values

  def initialize(name)
    @name = name
  end


end