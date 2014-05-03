require 'cell'
require 'grid'

describe Cell do
  let(:grid){Grid.new('015003002000100906270068430490002017501040380003905000900081040860070025037204600')}
  let(:a0){grid.cells[0]}
  let(:i8){grid.cells[80]}
  let(:a1){grid.cells[1]}

  it 'can have a list of possible values' do
    expect(a0.missing_values(grid)).to eq [6]
    expect(i8.missing_values(grid)).to eq [1,8,9]
  end

  it 'knows if it is solved' do
    expect(a0.solved?).to be_false
    expect(a1.solved?).to be_true
  end

  it 'can solve itself if it only has 1 missing value' do
    a0.solve!(grid)
    expect(a0.solved?).to be_true
  end

  


end