require "pry"

class TicTacToe
WIN_COMBINATIONS = [
    [0,1,2],
    [0,3,6],
    [0,4,8],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [3,4,5],
    [6,7,8]
  ]

def initialize
  @board = [" ", " ", " ", " ", " ", " ", " "," ", " "]
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(index, value = "X")
  @board[index] = value
end

def position_taken?(input)
  if @board[input] == "X" || @board[input] == "O"
    true
  else
    false
  end
end

def valid_move?(input)
  !position_taken?(input) && input.between?(0, 8)
end

def turn_count
  turn = 0
  @board.each do |token|
    if token == "X" || token == "O"
      turn += 1
    end
  end
  turn
end

def current_player
  if turn_count.even?
    "X"
  elsif turn_count.odd?
    "O"
  end
end

def turn
  greeting = puts "Please enter a number 1-9"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
  else
    turn
  end
  display_board
end

def won?
  WIN_COMBINATIONS.any? do |combo|
    if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
       return combo
    end
  end
end

def full?
@board.all? do |token|
  token == "X" || token == "O"
end
end

def draw?
  full? && !won?
end

def over?
  won? || draw?
end

def winner
  if won?.class == Array
    @board[won?[0]]
  end
end

def play
turn until over?
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
