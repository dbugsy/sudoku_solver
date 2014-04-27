require 'grid'

describe Grid do
  
  let(:grid){Grid.new}

  it 'contains an array with nine rows' do
    expect(grid.rows.count).to eq 9
  end

  it 'creates an array with nine columns' do
    expect(grid.columns.count).to eq 9
  end

  it 'creates nine boxes' do
    expect(grid.boxes.count).to eq 9
  end

  it 'creates cells with a name' do
    expect(grid.cells[9].name).to eq 'B1'
  end

  it 'distribute cells into columns' do
    expect(grid.columns[2][2].name).to eq 'C3'
  end

  it 'distribute cells into rows' do
    expect(grid.rows[5][5].name).to eq 'F6'
  end

  it 'distribute cells into boxes' do
    expect(grid.boxes[4][4].name).to eq 'E5'
  end

  xit 'assigns row neighbours to cell' do

  end

  xit 'reads cell contents' do
  end

  xit 'solves the puzzle' do
  end

end