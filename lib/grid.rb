require_relative './row'
require_relative './column'
require_relative './box'
require_relative './cell'

class Grid

  attr_reader :rows, :columns, :boxes, :cells

  def initialize
    create_rows
    create_columns
    create_boxes
    create_cells
  end

  def create_rows
    @rows = []
    enum = (1..9).each
    9.times {@rows << Row.new(enum.next)}
  end

  def create_columns
    @columns = []
    enum = ('A'..'I').each
    9.times {@columns << Column.new(enum.next)}
  end

  def create_boxes
    @boxes = []
    enum = (1..9).each
    9.times {@boxes << Box.new(enum.next)}
  end

  def create_cells
    @cells = []
    cell_names = ('A1'..'I9').to_a.reject{|ele| ele.include?('0')}.each
    81.times {@cells << Cell.new(cell_names.next)}
    assign_cell_positions
  end

  def assign_cell_positions
    assign_cols
    assign_rows
  end

  def assign_cols
    cell_cols = cells.each_slice(9).to_a
    cols = @columns.each
    cell_cols.each { |column| cols.next.cells=(column) }
  end

  def assign_rows
    cell_rows = cells.each_slice(9).to_a.transpose
    rows = @rows.each
    cell_rows.each { |row| rows.next.cells=(row) }
  end

  
end