require 'grid'

describe Grid do
  
  let(:grid){Grid.new('015003002000100906270068430490002017501040380003905000900081040860070025037204600')}
  let(:solvedgrid){Grid.new('615493872348127956279568431496832517521746389783915264952681743864379125137254698')}

  it 'creates 81 cells' do
    expect(grid.cells.count).to eq 81
  end

  it 'creates cells with a name' do
    expect(grid.cells[9].name).to eq 'A1'
    expect(grid.cells[80].name).to eq 'I8'
  end

  it 'assigns cell column value' do
    expect(grid.cells[15].containers[:column]).to eq 6
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

  it 'knows if it is solved' do
    expect(grid.solved?).to be_false
    expect(solvedgrid.solved?).to be_true
  end

  it "can solve the puzzle" do
      expect(grid.solved?).to be_false
      grid.solve!
      expect(grid.cells[0].solved?).to be_true
      expect(grid.solved?).to be_true
      expect(grid.solution).to eq('615493872348127956279568431496832517521746389783915264952681743864379125137254698')
  end

end