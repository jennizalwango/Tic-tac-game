class Player
    attr_accessor :piece, :enemy
  
    X_COMPETER = 'X'
    O_COMPETER = 'O'
  
    def initialize(piece)
      @piece = piece
      @enemy = piece == X_COMPETER ? O_COMPETER : X_COMPETER 
    end
end
  