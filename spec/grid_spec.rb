require 'grid'

describe Grid do
  
  let(:grid){Grid.new}

  it 'contains an array with 81 elements' do
    expect(grid.cells.count).to eq 81
  end

  it 'creates boxes, columns and rows' do
  end

  xit 'reads cell contents' do
  end

  xit 'solves the puzzle' do
  end

end