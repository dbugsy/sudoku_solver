class Cell
  
  CELL_VALUES = (1..9).to_a

  attr_accessor :name, :containers, :value

  def initialize(name)
    @name = name
    @containers = {}
  end


end