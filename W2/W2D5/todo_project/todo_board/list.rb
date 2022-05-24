require_relative "item.rb"

class List

    attr_accessor :label
    
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = "")
        return false if Item.valid_date?(deadline) == false
        @items << Item.new(title, deadline, description)
        return true
    end

    def size
        @items.length
    end

    def valid_index?(index)
        if index < 0 || @items[index] == nil
            return false
        else
            return true
        end
    end

    def swap(idx_1, idx_2)
        if valid_index?(idx1) == true && valid_index?(idx_2) == true
            @items[idx1], @items[idx2] = @items[idx2], @items[idx1]
            return true
        else
            return false
        end
    end

    def [](index)
        return nil if valid_index?(index) == false
        return @items[index]
    end
   
    def priority
        return @items[0]
    end

    def print
        
    end
end