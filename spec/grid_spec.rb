require 'grid'

describe Grid do
  
  let(:grid){Grid.new('015003002000100906270068430490002017501040380003905000900081040860070025037204600')}

  it 'creates 81 cells' do
    expect(grid.cells.count).to eq 81
  end

  it 'creates cells with a name' do
    expect(grid.cells[9].name).to eq 'A1'
    expect(grid.cells[80].name).to eq 'I8'
  end

  it 'assigns cell column value' do
    expect(grid.cells[15].containers[:columns]).to eq 6
  end

  it 'assigns cell row value' do
    expect(grid.cells[15].containers[:row]).to eq 1
  end

  it 'assigns cell box value' do
    expect(grid.cells[15].containers[:box]).to eq 6
  end

  it 'assigns values to cells based on argument' do
    expect(grid.cells[0].value).to eq 0
    expect(grid.cells[1].value).to eq 1
    expect(grid.cells[80].value).to eq 0
  end

  xit 'solves the puzzle' do
  end

end