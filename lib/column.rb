class Column

  attr_accessor :cells

  def initialize(name)
    @name = name
    @cells = []
  end

end