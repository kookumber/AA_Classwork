class Board

    # will add player's marks
    # will check for winners
    # will print the updated gameboard

    attr_reader :grid

    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
    end

    def valid?(position) #should be an array with 2 nums for elements
        row = position[0]
        col = position[1]
        if @grid[row][col] != nil
            puts "Position is good"
            return true
        else
            puts "Position is out of bounds"
            return false
        end
    end

    def empty?(position)
        row = position[0]
        col = position[1]
        @grid[row][col] == "_"
    end

    def place_mark(position, mark)
        row = position[0]
        col = position[1]
        
        if !self.empty?(position) || !self.valid?(position)
            raise "position is not valid or already filled"
        else
            @grid[row][col] = mark
        end
    end

    def print
        puts @grid.map {|marks| marks.join(" ")}
    end

    def win_row?(mark)
        @grid.each do |row| 
            if row.count(mark) == @grid.length
                return true
            else
                return false
            end
        end
    end

    def win_col?(mark)
        @grid.transpose.each do |row| 
            if row.count(mark) == @grid.length
                return true
            else
                return false
            end
        end
    end

    def win_diagonal?(mark)
        range = @grid.length
        diag_1 = []
        diag_2 = []
        (0...range).each {|i| diag_1 << [i, i]}
        (0...range).each {|i| diag_2 << [1, range - 1 - i]}

        count_diag_1 = 0
        count_diag_2 = 0

        diag_1.each do |pos|
            row = pos[0]
            col = pos[1]
            count_diag_1 += 1 if @grid[row][col] == mark
        end

        diag_2.each do |pos|
            row = pos[0]
            col = pos[1]
            count_diag_2 += 1 if @grid[row][col] == mark
        end

        count_diag_1 == range || count_diag_2 == range
    end

    def win?(mark)
        win_col?(mark) == true || win_row?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.count("_") >= 1
    end

end