require_relative 'board'
require_relative 'interface'
require_relative 'computer'
require_relative 'human'


class Game
  attr_accessor :board, :human, :computer, :interface, :human_turn

  def initialize(board, human, computer, interface)
    @board = board
    @human = human
    @computer = computer
    @interface = interface
    @human_turn = false
  end

  def play
    choose_characters

    until @board.game_over? || @board.winner?
      if @human_turn
        @interface.display_board(@board)
        human_plays
      else
        computer_plays
      end
      current_player
    end

    @interface.display_board(board)
    evaluate_game
  end

  def choose_characters
    turn_ply = @interface.turn_to_play
    if turn_ply == '1'
      @human_turn = true
    elsif turn_ply == '2'
      @human_turn = false
    else
      choose_characters
    end
  end

  def computer_plays
    @interface.print_message('wait, still thinking...')
    @computer.move(@board)
  end

  def human_plays
    move = @interface.take_position
    if @board.valid_moves.include?(move)
      @human.move(@board, move.to_i)
    else
      human_plays
    end
  end

  def current_player
    @human_turn = !@human_turn
  end

  def evaluate_game
    @board.tie? ? @interface.print_tie : @interface.print_winner(board)
  end
end
