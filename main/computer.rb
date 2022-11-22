require_relative 'player'

class Computer < Player
  attr_reader :move_made

  CONUTER = 0
  def move(board)
    minimax(board, @piece, CONUTER)
    board.set_user_input(@move_made.to_i, @piece)
  end

  private

  def count_taken(board, depth)
    total_count = board.grid.size + 1

    if board.winner?
      if board.winner == @piece
        return (total_count - depth)
      else
        return (depth - total_count)
      end
    else
      return 0
    end
  end

  def minimax(board, current_player, depth)
    counts_arry = []
    moves = []

    return count_taken(board, depth) if board.game_over?

    board.valid_moves.each do |move|
      board.set_user_input(move.to_i, current_player)

      next_player = current_player == @piece ? @enemy : @piece
      counts_arry << minimax(board, next_player, depth + 1)
      moves << move

      board.reset_user_input(move.to_i)
    end

    if current_player == @piece
      max_count_taken_idx = counts_arry.each_with_index.max[1]
      @move_made = moves[max_count_taken_idx]
      return counts_arry[max_count_taken_idx]
    else
      min_count_taken_idx = counts_arry.each_with_index.min[1]
      @move_made = moves[min_count_taken_idx]
      return counts_arry[min_count_taken_idx]
    end
  end
end
