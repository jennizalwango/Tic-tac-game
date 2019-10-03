
class Board
    attr_accessor :size, :grid
    
    def initialize(dimensions = 3)
        @size = dimensions * dimensions
        @grid = ('1'..size.to_s).to_a
    end
    
    puts @grid
    
    def valid_moves
        grid.reject { |piece| piece == 'X' || piece == 'O' }
    end
    
    def user_input(index)
        grid[index - 1]
    end
    
    def set_user_input(index, piece)
        grid[index - 1] = piece
    end
    
    def reset_user_input(index)
        grid[index - 1] = index.to_s
    end
    
    def check_rows
        grid.each_slice(Math.sqrt(size)).to_a
    end
    
    def check_columns
        check_rows.transpose
    end
    
    def diagonals
        range = Math.sqrt(size) - 1
        diagonal_1 = (0..range).collect { |i| check_rows[i][i] }
        diagonal_2 = (0..range).collect { |i| check_rows.reverse[i][i] }
    
        [diagonal_1, diagonal_2.reverse]
    end
    
    def row_win?
        check_rows.each { |row| return true if row.uniq == ['X'] || row.uniq == ['O'] }
        false
    end
    
    def column_win?
        check_columns.each { |col| return true if col.uniq == ['X'] || col.uniq == ['O'] }
        false
    end
    
    def diagonal_win?
        diagonals.each { |d| return true if d.uniq == ['X'] || d.uniq == ['O'] }
        false
    end
    
    def winner?
        row_win? || column_win? || diagonal_win?
    end
    
    def tie?
        valid_moves.length.zero? && !winner?
    end
    
    def game_over?
        winner? || valid_moves.length.zero?
    end
    
    def winner
        check_rows.each { |row| return row.uniq.first if row.uniq.length == 1 }
        check_columns.each { |col| return col.uniq.first if col.uniq.length == 1 }
        diagonals.each { |diag| return diag.uniq.first if diag.uniq.length == 1 }
    end
    end
    