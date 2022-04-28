require_relative "board"
require_relative "human_player"

class Game
    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(:X)
        @player_2 = HumanPlayer.new(:O)
        @board = Board.new()
        @current_player = @player_1
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        elsif @current_player == @player_2
            @current_player = @player_1
        end
    end

    def play
        while @board.empty_positions? == true
            @board.print #print the starting board
            pos = @current_player.get_position #get pos from current player
            @board.place_mark(pos, @current_player.mark)

            if @board.win?(@current_player.mark) == true
                puts "Victory!"
                return
            else
                self.switch_turn
                puts "switching player turns"
            end
            puts "draw"
        end
    end
end