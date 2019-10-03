require_relative 'player'

class Human < Player
  def move(board, index)
    board.set_user_input(index.to_i, @piece)
  end
end
