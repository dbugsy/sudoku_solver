require 'grid'

describe Grid do

  let(:grid){Grid.new('015003002000100906270068430490002017501040380003905000900081040860070025037204600')}
  let(:solvedgrid){Grid.new('615493872348127956279568431496832517521746389783915264952681743864379125137254698')}
  let(:hardgrid){Grid.new('800000000003600000070090200050007000000045700000100030001000068008500010090000400')}
  let(:insanegrid){Grid.new('000002040000000000000000600950000800000100000000000000000700000003000000000000000')}

  context 'Cell Builder' do

    
    it 'creates 81 cells' do
      expect(grid.cells.count).to eq 81
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

  end

  context 'solving an easy puzzle' do

    it 'knows if it is solved' do
      expect(grid.solved?).to be_false
      expect(solvedgrid.solved?).to be_true
    end

    it "can solve an easy sudoku" do
        expect(grid.solved?).to be_false
        grid.solve!
        expect(grid.cells[0].solved?).to be_true
        expect(grid.solved?).to be_true
        expect(grid.solution).to eq '615493872348127956279568431496832517521746389783915264952681743864379125137254698'
    end

    it 'can return a completed sudoku' do
      grid.solve!
      expect(grid.solution.length).to eq 81
    end

  end

  context 'solving a hard puzzle' do

    
    it 'can solve a hard sudoku' do
      hardgrid.solve!
      expect(hardgrid.solved?).to be_true
    end

    it 'can solve an extremely hard sudoku' do
      insanegrid.solve!
      expect(insanegrid.solved?).to be_true
    end  
  end

  context 'creating a puzzle' do

    it 'can create an array of cells in order of containers' do
      expect(solvedgrid.array_of_(:box)[0][0].containers[:box]).to eq 0
      expect(solvedgrid.array_of_(:box)[8][8].containers[:box]).to eq 8
      expect(solvedgrid.array_of_(:row)[8][8].containers[:row]).to eq 8
      expect(solvedgrid.array_of_(:column)[8][8].containers[:column]).to eq 8
    end

     it 'adds a zero to each box, row and column' do
      solvedgrid.puzzle!
      expect(solvedgrid.array_of_(:box).select {
        |box| box.map {|cell| cell.value
          }.include?("0")}.count).to eq 9
      expect(solvedgrid.array_of_(:row).select {
        |box| box.map {|cell| cell.value
          }.include?("0")}.count).to eq 9
      expect(solvedgrid.array_of_(:column).select {
        |box| box.map {|cell| cell.value
          }.include?("0")}.count).to eq 9
    end

    it 'returns the values of the cells as a string of 81 characters' do
      expect(solvedgrid.puzzle!.length).to eq 81
      expect(solvedgrid.puzzle!.class).to eq String 
    end
  end
end