class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [1,4,7],
    [2,4,6],
    [0,3,6],
    [2,5,8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(player_input)
    player_input.to_i - 1
  end

  def move(position, x_or_o)
    @board[position] = x_or_o
  end

  def position_taken?(position_num)
    ((@board[position_num] == "X") || (@board[position_num] == "O"))
  end

  def valid_move?(position_num)
    position_num.between?(0,8) && !position_taken?(position_num)
  end

  def turn_count
    number_of_turns = 0
    @board.each do |space|
      if space == "X" || space == "O"
        number_of_turns += 1
      end
    end
    return number_of_turns
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    char = current_player
    if valid_move?(index)
      move(index, char)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        return win_combo
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return win_combo
      end
        false
      end
    end

  def full?
    @board.all?{|occupied| occupied != " "}
  end

  def draw?
    !(won) && (full?)
  end

  def over?

  end

end
