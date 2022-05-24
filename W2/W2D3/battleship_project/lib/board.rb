class Board
  
    #------ START PART 1 ----->
    attr_reader :size

    def initialize(num)
        @num = num
        @grid = Array.new(num) {Array.new(num, :N)}
        @size = num * num
    end

    def [](arr) #example is [3, 4] => [row, col]
        row = arr[0]
        col = arr[1]
        @grid[row][col]
    end

    def []=(position, value)
        row = position[0]
        col = position[1]
        @grid[row][col] = value
    end

    def num_ships
        count = 0
        @grid.each {|row| count += row.count(:S)}
        count
    end

    #----- END PART 1 ------>

    #----- START PART 2 ----->

    def attack(position) #position is still arr like [2, 4]
        if self[position] == :S
            self[position] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        quarter = @size / 4 #get num of times to replace :N with :S
        # arr = [] #empty array we set to fill in with grid positions
        range = @grid.length - 1 #length of grid while will give us max position range

        # quarter.times {|i| arr << [rand(0..range), rand(0..range)]} #add to arr random positions

        # while arr.uniq.length < quarter
        #     arr << [rand(0..range), rand(0..range)]
        # end #makes sure we're not using same positions multiple times

        # final_arr = arr.uniq #gives final grid that should have uniq positions count equiv to quarter

        # final_arr.each do |pos| #loops through the final arr and reassigns grid positions with :S
        #     row = pos[0]
        #     col = pos[1]
        #     @grid[row][col] = :S

        while num_ships < quarter
            rand_r = rand(0..range)
            rand_c = rand(0..range)
            @grid[rand_r][rand_c] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
    end

    def self.print_grid(grid)
        puts grid.map {|ele| ele.join(" ")}
    end

    def cheat
       Board.print_grid(@grid)
    end

    def print
       Board.print_grid(hidden_ships_grid)
    end
    
end
