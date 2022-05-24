

class Piece

    attr_reader :color, :board
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def symbol
        :O
    end

    def to_s
        case symbol
        when :Q
            return " ♕ "
        when :K
            return " ♔ "
        when :B
            return " ♗ "
        when :H
            return " ♘ "
        when :P
            return " ♙ "
        when :R
            return " ♖ "
        else
            return " _ "
        end
    end

    def empty?
        false
    end

    def valid_moves?
    end

    def pos=(val)
    end

    

    private

    def move_into_check?(end_pos)
    end

end 