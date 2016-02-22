class TicTacToe
  def initialize(board=nil)
    @board = board || Array.new(9," ")
  end
  # ********************************************************************
  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],
    [0,3,6],[1,4,7],[2,5,8],
    [0,4,8],[6,4,2]
    ]
  # ********************************************************************
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  # ********************************************************************
  def move(position, token)
    position = position.to_i
    @board[position - 1] = token
    display_board
  end
 # ********************************************************************* 
  def position_taken?(position)
  if @board[position] == " "
    false
  elsif @board[position] == ""
    false
  elsif @board[position] == nil
    false
  else @board[position] == "X" || @board[position] == "O"
    true
  end
  end
  # ********************************************************************
  def valid_move?(position)
  position = position.to_i
  position = position - 1
  if position_taken?(position) || !(position.between?(0, 8))
    false
  else
    true
  end
  end  
  # ********************************************************************
  def turn
  puts "Please enter 1-9:"
  token = current_player
  position = gets.strip
  if valid_move?(position) == true
    move(position, token)
    display_board
  else
    turn
  end
  end
  # ********************************************************************
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  # ********************************************************************
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  # ********************************************************************
  def won?
  WIN_COMBINATIONS.detect do |win_combo|
  @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]] && position_taken?(win_combo[0])
  end
  end
  # *********************************************************************
  def full?
    @board.all? {|token| token == "X" || token == "O"}
  end
  # *********************************************************************

  def draw?
    !won? && full?
  end
  # *********************************************************************

  def over?
    won? || full? || draw?
  end
  # **********************************************************************
  def winner
    if win_combo = won?
      @board[win_combo.first]
    end
  end 

def play
  while over? == !true
    turn
  end
  
  if winner == "X"
    puts "Congratulations X!"
    elsif winner == "O"
    puts "Congratulations O!"
    else
    puts "Cats Game!"
  end
end
end
  