class Board

    attr_reader :size

    def initialize(size)
        @size = size
        @grid = Array.new(@size) {Array.new(@size)}
    end

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, mark)
        row, col = pos
        @grid[row][col] = mark
    end

    def complete_row?(mark)
        @grid.any? { |row| row.count(mark) == @size }
    end

    def complete_col?(mark)
        (@grid.transpose).any? { |row| row.count(mark) == @size }
    end

    def complete_diag?(mark)
        diag_1 = []
        diag_2 = []
        (0...@size).each { |i| diag_1 << [i, i]}
        (0...@size).each { |i| diag_2 << [i, @size - 1 - i] }

        diag_1_count = 0
        diag_2_count = 0

        diag_1.each { |i| diag_1_count += 1 if @grid[i[0]][i[1]] == mark}
        diag_2.each { |i| diag_2_count += 1 if @grid[i[0]][i[1]] == mark}

        diag_1_count == size || diag_2_count == size
    end

    def winner?(mark)
        complete_row?(mark) || complete_col?(mark) || complete_diag?(mark)
    end
end
