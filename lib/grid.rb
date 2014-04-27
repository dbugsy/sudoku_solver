class Grid

  attr_reader :cells

  def initialize
    @cells = Array.new(81)
  end

  def rows
    @cells.each_slice(9).to_a
  end

  def columns
    rows.transpose
  end

end