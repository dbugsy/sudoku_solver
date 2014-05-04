require_relative '../sudoku.rb'

describe 'Sudoku' do
  
  it 'generates a random sudoku' do
    expect(random_sudoku.length).to eq 81
  end

end