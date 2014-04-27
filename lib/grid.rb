require_relative './cell'

class Grid

  attr_reader :rows, :columns, :boxes, :cells

  def initialize
    create_cells
    create_rows
    create_columns
    create_boxes
  end

  def create_cells
    @cells = []
    cell_names = ('A1'..'I9').to_a.reject{|ele| ele.include?('0')}.each
    81.times {@cells << Cell.new(cell_names.next)}
  end

  def create_rows
    @rows = []
    cell_rows = cells.each_slice(9).to_a.transpose
    cell_rows.each { |row| @rows << row }
  end

  def create_columns
    @columns = []
    cell_cols = cells.each_slice(9).to_a
    cell_cols.each { |column| @columns << column }
  end

  def create_boxes
    @boxes = []
    9.times { @boxes << Array.new}
    array_segments = cells.each_slice(3).to_a
    box_enum = [0,3,6,0,3,6,0,3,6,1,4,7,1,4,7,1,4,7,2,5,8,2,5,8,2,5,8].each
    array_segments.each{|segment| @boxes[box_enum.next].concat(segment)}
    print boxes.inspect
  end

  def assign_boxes
    
  end
end