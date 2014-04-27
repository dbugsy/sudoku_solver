require 'grid'

describe Grid do
  
  let(:grid){Grid.new}

  it 'contains an array with 81 elements' do
    expect(grid.cells.count).to eq 81
  end

  it 'creates nine rows' do
    expect(grid.rows.count).to eq 9
  end

  it 'each row has nine elements' do
    expect(grid.rows[0].count).to eq 9
  end

  xit 'creates columns' do
  end

  xit 'creates rows' do
  end

  xit 'reads cell contents' do
  end

  xit 'solves the puzzle' do
  end

end