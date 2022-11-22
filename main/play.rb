require_relative 'mygame'
require_relative 'board'
require_relative 'player'
require_relative 'human'
require_relative 'computer'
require_relative 'interface'

x_competer = Player::X_COMPETER
o_competer = Player::O_COMPETER
game = Game.new(Board.new, Human.new(x_competer), Computer.new(o_competer), Interface.new)
game.play
