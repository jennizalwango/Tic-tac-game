class Interface
    def print_message(message)
      puts message
    end
  
    def receive_input
      gets.chomp
    end
   
    def board_to_string(board)
      board_to_s = ''
      board_to_s << " #{board.grid[0]} | #{board.grid[1]} | #{board.grid[2]} "
      board_to_s << "\n-----------\n"
      board_to_s << " #{board.grid[3]} | #{board.grid[4]} | #{board.grid[5]} "
      board_to_s << "\n-----------\n"
      board_to_s << " #{board.grid[6]} | #{board.grid[7]} | #{board.grid[8]} "
      board_to_s
    end
  
    def display_board(board)
      print_message(board_to_string(board))
    end
  
    def print_winner(board)
      print_message("#{board.winner} wins the game!")
    end
  
    def print_tie
      print_message('Ah its a tie game!')
    end
    
    # take_turn
    # receive_turn_preference
    def turn_to_play
      print_message('Choose a turn to play (1 or 2): ')
      receive_input
    end
  
    # take_position
    def receive_piece_index
      print_message('Enter a position you to take (1-9): ')
      receive_input
    end
  end
  


















































# board = [" ", " ", " ", " ", " ", " ", " ", " ", " " ]
# index = %w[" ", " ", " ", " ", " ", " ", " ", " ", " " ]
# def display_board(board)
#     puts " #{board[0]} | #{board[1]} | #{board[2]} "
#     puts "-----------"
#     puts " #{board[3]} | #{board[4]} | #{board[5]} "
#     puts "-----------"
#     puts " #{board[6]} | #{board[7]} | #{board[8]} "
# end
# puts display_board(board)

 

# def move(board, index, player)
#     board[index] = player
# end


# def position_taken?(board, index)
#     if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
#        return false 
#     else
#        return true
#     end
# end

# def valid_move(board, index)
#     if index(0..8) && !position_taken?(board, index)
#        return true
#     end
# end

# display_board(board)
# valid_move(board, index)
# position_taken?(board, index)
# input_to_index(user_input)
# move(board, index, first_player = "X")


# def turn_count(board)
#     counter = 0
#     board.each do |spaces|
#        if spaces == "X" || spaces == "O"
#           counter += 1
#        end
#     end
#     counter
# end

# def current_player(board)
#     turn_count(board) % 2 == 0 ? "X" : "O"
# end


# # Play Method A
# def play(board)
#    counter = 0
#    until counter == 9
#      turn(board)
#      counter += 1
#    end
# end

# # Play Method B
# def play(board)
#    until over?(board) 
#       turn(board)
#    end 
#    if won?(board)
#       winner(board) == "X" || winner(board) == "O" 
#       puts "Congratulations #{winner(board)}!" 
#    elsif draw?(board)
#       puts "Its a tie!" 
#    end 
# end

# def turn(board)
#     puts "Please enter 1-9:"
#     user_input = gets.strip
#     index = input_to_index(user_input)
#     if valid_move(board, index)
#        move(board, index, current_player(board))
#        turn(board)
#     end
#     display_board(board)
# end

#  WIN_COMBINATIONS = [ 
#     [0,1,2], # top_row 
#     [3,4,5], # middle_row 
#     [6,7,8], # bottom_row 
#     [0,3,6], # left_column 
#     [1,4,7], # center_column 
#     [2,5,8], # right_column 
#     [0,4,8], # left_diagonal 
#     [6,4,2] # right_diagonal 
#     ]

# parent_array = WIN_COMBINATIONS 
# WIN_COMBINATIONS = [ children_arrays ]
# children_arrays = [0,1,2],[3,4,5],[6,7,8]...[6,4,2] 


# def won?(board)
#     WIN_COMBINATIONS.each do |win_combination|
#       win_index_1 = win_combination[0]
#       win_index_2 = win_combination[1]
#       win_index_3 = win_combination[2]
#       position_1 = board[win_index_1] # value of board at win_index_1
#       position_2 = board[win_index_2] # value of board at win_index_2
#       position_3 = board[win_index_3] # value of board at win_index_3
#       position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
#     end
# end
#    #position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1) 
# #The above code means to return first element (position_1) & make sure the position is taken by X or O

# def full?(board)
#     board.all? {|i| i == "X" || i == "O"}
# end

# def draw?(board)
#     if !won?(board) && full?(board)
#       return true
#     elsif !won?(board) && !full?(board)
#       return false
#     else won?(board)
#       return false
#     end
# end

# def over?(board)
#     if draw?(board) || won?(board) || full?(board)
#       return true
#     end
# end

# def winner(board)
#    if won?(board)
#       return board[won?(board)[0]]
#    end
# end