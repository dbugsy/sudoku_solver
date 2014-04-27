require_relative './row'
require_relative './column'
require_relative './box'
require_relative './cell'

class Grid

  attr_reader :rows, :columns, :boxes, :cells

  def initialize
    create_rows
    create_columns
  end

  def create_rows
    @rows = []
    enum = (1..9).each
    9.times {@rows << Row.new(enum.next)}
    @rows
  end

  def create_columns
    @columns = []
    enum = ('A'..'I').each
    9.times {@columns << Column.new(enum.next)}
    @columns
  end

end