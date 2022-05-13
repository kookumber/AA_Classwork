class Hanoi

    attr_reader :board
    attr_writer :board

    def initialize
        @board = [[5, 4, 3, 2, 1], [], []]
    end

    def won?
        if board == [[], [], [5, 4, 3, 2, 1]]
            return true 
        else
            return false
        end
    end

    def move(from_stack, to_stack)
        raise "stack is empty" if board[from_stack].empty?

        if board[to_stack][-1].nil? || (board[from_stack][-1] < board[to_stack][-1]) 
            disc = board[from_stack].pop
            board[to_stack].push(disc)
        else
            raise "invalid move"
        end
        @board
    end

end