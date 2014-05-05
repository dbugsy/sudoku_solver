require 'sinatra'
require 'sinatra/partial'
require 'rack-flash'
require_relative './lib/grid'
require_relative './lib/cell'

enable :sessions
set :session_secret, "something"
set :partial_template_engine, :erb
use Rack::Flash

get '/' do
  prepare_to_check_solution
  generate_new_puzzle unless @check_solution
  set_session_variables
  erb :index
end

post '/' do
  cells = box_order_to_row_order(params["cell"])
  session[:current_game] = cells.map{|value| value.to_i }
  session[:check_solution] = true
  redirect to("/")
end

def set_session_variables
  @current_game = session[:current_game] 
  @solution = session[:solution]
  @puzzle = session[:puzzle]
end

def generate_new_puzzle
  sudoku = Grid.new(seed.join)
  sudoku.solve!
  @tagline = "new puzzle!"
  session[:solution] = sudoku.cells.map(&:value)
  session[:puzzle] = puzzle(sudoku)
  session[:current_game] = session[:puzzle]
end

def prepare_to_check_solution
  @check_solution = session[:check_solution]
  if @check_solution
    flash[:notice] = "Incorrect values are highlighted in yellow"
  end
  session[:check_solution] = nil
end

def seed
  (1..9).to_a.shuffle + Array.new(81-9, 0)
end

def puzzle(sudoku, level=20)
  puzzle_array = sudoku.puzzle!.chars
  add_zeros(puzzle_array, level)
end

def add_zeros(puzzle_array, level)
  zeros = puzzle_array.select {|number| number=="0"}
  return puzzle_array.join if zeros.count >= level
  target = rand(81)
  puzzle_array[target] = "0" if puzzle_array[target] != "0"
  add_zeros(puzzle_array, level)
end

def box_order_to_row_order(cells)
  boxes=cells.each_slice(9).to_a
  (0..8).to_a.inject([]) do |memo, i|
    first_box_index = i / 3 * 3
    three_boxes = boxes[first_box_index, 3]
    three_rows_of_three = three_boxes.map do |box|
      row_number_in_a_box = i % 3
      first_cell_in_the_row_index = row_number_in_a_box * 3
      box[first_cell_in_the_row_index, 3]
    end
    memo += three_rows_of_three.flatten
  end
end

helpers do

  def colour_class(solution_to_check, puzzle_value, current_game_value, solution_value)
    must_be_guessed = puzzle_value.to_i == 0
    tried_to_guess = current_game_value.to_i != 0
    guessed_incorrectly = current_game_value != solution_value
    if solution_to_check &&
        must_be_guessed &&
        tried_to_guess &&
        guessed_incorrectly
        'incorrect'
    elsif !must_be_guessed
    'value-provided'
    end 
  end

  def cell_value(value)
    value.to_i == 0 ? '' : value
  end

end