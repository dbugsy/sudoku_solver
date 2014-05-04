require 'sinatra'
require_relative './lib/grid'
require_relative './lib/cell'

enable :sessions

get '/' do
  @solution = random_sudoku
  session[:last_visit] = Time.now.to_s
  session[:solution] = @solution
  @current_game = puzzle(@solution)
  erb :index 
end

def random_sudoku
  seed = (1..9).to_a.shuffle + Array.new(81-9, 0)
  sudoku = Grid.new(seed.join)
  sudoku.solve!
  sudoku.cells.map(&:value).join
end

def puzzle(sudoku)
  sudoku.puzzle!
end


