class Player

    def get_move(input = gets.chomp)
        puts "enter a position with coordinates separated with a space like '4 7'"
        return input.split.map {|i| i.to_i}
    end
end
