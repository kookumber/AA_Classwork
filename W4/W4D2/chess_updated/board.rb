require_relative "piece.rb"
require_relative "null_piece.rb"
require_relative "queen.rb"
require_relative "rook.rb"
require_relative "bishop.rb"
require_relative "king.rb"
require_relative "knight.rb"
require_relative "pawn.rb"

class Board

    attr_reader :rows, :black_pieces, :white_pieces
    def initialize 
        @rows = Array.new(8) {Array.new(8, NullPiece.instance) } #have to make this null piece }
        @null_piece = NullPiece.instance
        @black_pieces = []
        @white_pieces = []
        populate
    end

    def [](pos)
        i, j = pos
        return @rows[i][j]
    end

    def []=(pos, val) #val is a piece
        i, j = pos
        @rows[i][j] = val
    end

    def move_piece(start_pos, end_pos) #need to refactor to add color of piece
        raise StandardError.new('starting position is empty') if self[start_pos] == @null_piece
        i, j = end_pos
        raise StandardError.new("Invalid end position") if i > 7 || j > 7 
        piece = self[start_pos]
        raise StandardError.new("Invalid move") if !piece.moves.include?(end_pos)
        self[end_pos] = piece
        piece.pos = end_pos
        self[start_pos] = @null_piece
    end

    def valid_pos?(pos)
        
    end

    def add_piece(piece, pos)
    end

    def in_check?(color)
        if color == :black
            king_pos = [] 
            @black_pieces.each do |piece1|
                king_pos = piece1.pos if piece1.is_a?(King)
            end
            @white_pieces.each do |piece2|
                return true if piece2.moves.include?(king_pos)
            end
        elsif color == :white
            king_pos = [] 
            @white_pieces.each do |piece1|
                king_pos = piece1.pos if piece1.is_a?(King)
            end
            @black_pieces.each do |piece2|
                return true if piece2.moves.include?(king_pos)
            end
        end
        return false
    end

    def check_mate?(color)
    end

    def find_king(color)
    end 

    def pieces
    end 

    def dup
    end

    def move_piece!(color, start_pos, end_pos)
    end

    def populate
        (0..7).each do |i|
            (0..7).each do |j|
                if (i == 0 && j == 3)
                    piece = Queen.new(:black, self, [i, j])
                    @rows[i][j] = piece
                    @black_pieces<< piece
                elsif (i == 7 && j == 3)
                    piece = Queen.new(:white, self, [i, j])
                    @rows[i][j] = piece
                    @white_pieces<< piece
                    #-------------------------- end queen
                elsif (i == 0 && j == 2) || (i == 0 && j == 5)
                    piece = Bishop.new(:black, self, [i, j])
                    @rows[i][j] = piece
                    @black_pieces<< piece
                elsif (i == 7 && j == 2) || (i == 7 && j == 5)
                    piece = Bishop.new(:white, self, [i, j])
                    @rows[i][j] = piece
                    @white_pieces<< piece
                    #-------------------------- end bishop
                elsif (i == 0 && j == 0) || (i == 0 && j == 7)
                    piece = Rook.new(:black, self, [i, j])
                    @rows[i][j] = piece
                    @black_pieces<< piece
                elsif (i == 7 && j == 0) || (i == 7 && j == 7)
                    piece = Rook.new(:white, self, [i, j])
                    @rows[i][j] = piece
                    @white_pieces<< piece
                    #-------------------------- end rook
                elsif (i == 0 && j == 4)
                    piece = King.new(:black, self, [i, j])
                    @rows[i][j] = piece
                    @black_pieces<< piece
                elsif (i == 7 && j == 4)
                    piece = King.new(:white, self, [i, j])
                    @rows[i][j] = piece
                    @white_pieces<< piece
                    #-------------------------- end king
                elsif (i == 0 && j == 1) || (i == 0 && j == 6) 
                    piece = Knight.new(:black, self, [i, j])
                    @rows[i][j] = piece
                    @black_pieces<< piece
                elsif (i == 7 && j == 1) || (i == 7 && j == 6)
                    piece = Knight.new(:white, self, [i, j])
                    @rows[i][j] = piece
                    @white_pieces<< piece
                    #-------------------------- end knight
                elsif i == 1
                    piece = Pawn.new(:black, self, [i, j])
                    @rows[i][j] = piece
                    @black_pieces<< piece
                elsif i == 6
                    piece = Pawn.new(:white, self, [i, j])
                    @rows[i][j] = piece
                    @white_pieces<< piece
                    #-------------------------- end pawn
                else
                    @rows[i][j] = @null_piece
                end
            end
        end
    end


end