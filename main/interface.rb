class Interface
    def print_message(message)
      puts message
    end
  
    def receive_input
      gets.chomp
    end
   
    def string_board(board)
      board_to_s = ''
      board_to_s << " #{board.grid[0]} | #{board.grid[1]} | #{board.grid[2]} "
      board_to_s << "\n-----------\n"
      board_to_s << " #{board.grid[3]} | #{board.grid[4]} | #{board.grid[5]} "
      board_to_s << "\n-----------\n"
      board_to_s << " #{board.grid[6]} | #{board.grid[7]} | #{board.grid[8]} "
      board_to_s
    end
  
    def display_board(board)
      print_message(string_board(board))
    end
    
    def turn_to_play
      print_message('Choose a turn to play (1 or 2): ')
      receive_input
    end
  
    def take_position
      print_message('Enter a position to take (1-9): ')
      receive_input
    end

    def print_tie
      print_message('Ah its a tie game!')
    end
  
    def print_winner(board)
      print_message("#{board.winner} wins the game!")
    end
  end
