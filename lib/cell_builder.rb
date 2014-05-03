module Cell_Builder

  def create_grid
    create_cells
    assign_rows
    assign_columns
    assign_boxes
  end

  def create_cells
    @cells = []
    cell_names = ('A0'..'I8').to_a.reject{|ele| ele.include?('9')}.each
    81.times {@cells << Cell.new(cell_names.next)}
    @cells = @cells.each_slice(9).to_a.transpose.flatten
  end

  def assign_rows
    rows = []
    cell_rows = cells.each_slice(9).to_a
    cell_rows.each { |row| rows << row }
    assign_container_values(rows, :row)
  end

  def assign_columns
    columns = []
    cell_cols = cells.each_slice(9).to_a.transpose
    cell_cols.each { |column| columns << column }
    assign_container_values(columns, :column)
  end

  def assign_boxes
    boxes = []
    9.times { boxes << Array.new}
    array_segments = cells.each_slice(3).to_a
    box_enum = [0,3,6,0,3,6,0,3,6,1,4,7,1,4,7,1,4,7,2,5,8,2,5,8,2,5,8].each
    array_segments.each{|segment| boxes[box_enum.next].concat(segment)}
    assign_container_values(boxes, :box)
  end

  def assign_container_values(containers, container_variable)
    container_values = (0..8).to_enum
    containers.each do |container| 
      index = container_values.next
      container.each {|cell| cell.containers[container_variable] = index} 
      end
  end
end