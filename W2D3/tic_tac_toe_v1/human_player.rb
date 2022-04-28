class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
        puts "your mark is " + @mark.to_s
    end

    def get_position(input = gets.chomp)
        puts "Enter 2 numbers with a space inbetween the 2"
        puts "Your input is " + input
        result = input.split.map {|i| i.to_i}
        if result.length != 2
            raise "Your input is wrong. Enter only 2 numbers with a space inbetween"
        end
        result
    end


end