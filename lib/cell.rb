class Cell
  
  CELL_VALUES = (1..9).to_a

  attr_accessor :name

  def initialize(name)
    @name = name
  end

end