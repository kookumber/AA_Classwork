class Board


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end

    def self.build_stacks(num)
        arr = Array.new(num) {Array.new([])}
        arr
    end

    attr_reader :max_height

    def initialize(num, max_height)
        @max_height = max_height
        @stacks = Board.build_stacks(num)
        if max_height < 4 || num < 4
            raise "rows and cols must be >= 4"
        end
    end

    def add(token, stack_idx)
        if @stacks[stack_idx].length < @max_height
            @stacks[stack_idx] << token
            return true
        elsif @stacks[stack_idx].length == @max_height
            return false
        end
    end

    def vertical_winner?(token)
        if @stacks.any? {|stack| stack.count(token) == @max_height}
            return true
        else
            return false
        end
    end

    def horizontal_winner?(token)
        # rows_matched = 0
        # (0...@stacks.length).each do |i|
        #     hor_count = 0
        #     @stacks.each_with_index do |ele1, row|
        #         ele1.each_with_index do |ele2, col|
        #             if col == i && ele2 == token
        #                 hor_count += 1
        #             end
        #             rows_matched += 1 if hor_count == @stacks.length
        #         end
        #     end
        # end
        # rows_matched >= 1

        (0...@stacks.length) each do |i|
            return true if @stacks.all?{|stack| stack[i] == token}
        end
        return false
    end

    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)
    end

end
