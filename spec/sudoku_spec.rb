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
    expect(puzzle(sudoku).chars.select {|number| number == "0"}.count).to eq 20
  end

  # it 'can convert box order to row order' do
  #   random_sudoku
  #   expect(box_order([0, 1, 2, 9, 10, 11, 18, 19, 20, 27, 28, 29, 36, 37, 38, 45, 46, 47, 54, 55, 56, 63, 64, 65, 72, 73, 74, 3, 4, 5, 12, 13, 14, 21, 22, 23, 30, 31, 32, 39, 40, 41, 48, 49, 50, 57, 58, 59, 66, 67, 68, 75, 76, 77, 6, 7, 8, 15, 16, 17, 24, 25, 26, 33, 34, 35, 42, 43, 44, 51, 52, 53, 60, 61, 62, 69, 70, 71, 78, 79, 80])).to eq box_order_to_row_order([0, 1, 2, 9, 10, 11, 18, 19, 20, 27, 28, 29, 36, 37, 38, 45, 46, 47, 54, 55, 56, 63, 64, 65, 72, 73, 74, 3, 4, 5, 12, 13, 14, 21, 22, 23, 30, 31, 32, 39, 40, 41, 48, 49, 50, 57, 58, 59, 66, 67, 68, 75, 76, 77, 6, 7, 8, 15, 16, 17, 24, 25, 26, 33, 34, 35, 42, 43, 44, 51, 52, 53, 60, 61, 62, 69, 70, 71, 78, 79, 80])
  # end

  # it 'can return the correct index for a cell' do
  #   expect(return_index(sudoku.cells[0])).to eq 0
  #   expect(return_index(sudoku.cells[80])).to eq 80
  # end

  # it 'can return an array of indices for cells arranged in boxes' do
  #   random_sudoku
  #   expect(box_indices[0]).to eq 0
  #   expect(box_indices[4]).to eq 10
  #   expect(box_indices[80]).to eq 80
  # end

end