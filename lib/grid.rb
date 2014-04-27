require_relative './row'
class Grid

  attr_reader :cells

  def initialize
    rows
  end

  def rows
    @rows = []
    enum = (1..9).each
    9.times {@rows << Row.new(enum.next)}
    @rows
  end

  def columns
    rows.transpose
  end

end