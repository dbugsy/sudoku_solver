require_relative '../sudoku.rb'

describe 'Sudoku' do

  let(:sudoku){Grid.new('615493872348127956279568431496832517521746389783915264952681743864379125137254698')}
  
  it 'generates a random sudoku' do
    expect(random_sudoku.length).to eq 81
  end

  it 'can add zeros according to the level of the puzzle' do
    expect(puzzle(sudoku).class).to eq String
    expect(puzzle(sudoku).length).to eq 81
    expect(puzzle(sudoku).include?("0")).to be_true
  end

end