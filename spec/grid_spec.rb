require 'grid'

describe Grid do
  
  let(:grid){Grid.new}

  it 'contains an array with nine rows' do
    expect(grid.rows.count).to eq 9
  end

  it 'creates an array with nine columns' do
    expect(grid.columns.count).to eq 9
  end

  xit 'creates nine boxes' do
  end

  xit 'reads cell contents' do
  end

  xit 'solves the puzzle' do
  end

end