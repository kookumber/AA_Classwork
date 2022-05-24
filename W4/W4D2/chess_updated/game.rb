require_relative "board.rb"
require_relative "display.rb"
require_relative "player.rb"
require_relative "human_player.rb"

class Game
    def initialize
        @board = Board.new 
        @display = Display.new(@board)
        @player1 = HumanPlayer.new(:black, @display)
        @player2 = HumanPlayer.new(:white, @display)
        @current_player = @player2
    end

    def play
        while true #take out in a bit
            @current_player.make_move(@board)
            swap_turn
            p "you're in check" if @board.in_check?(:black)
        end
    end

    def swap_turn
        if @current_player == @player2
            @current_player = @player1 
        else
            @current_player = @player2
        end
    end

end

game = Game.new

game.play

