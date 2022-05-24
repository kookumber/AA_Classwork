# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.length == 0
        return self.max - self.min if self.all? {|i| i.is_a?(Integer)}
    end

    def average
        return nil if self.length == 0
        return (self.sum * 1.0 / self.length * 1.0) if self.all? {|i| i.is_a?(Integer)}
    end

    def median
        return nil if self.length == 0
        num_of_eles = self.length
        sorted_self = self.sort
        if num_of_eles.odd? #odds
            return sorted_self[num_of_eles/2]
        else
            return (sorted_self[num_of_eles/2] + sorted_self[num_of_eles/2-1]) * 1.0 /2 * 1.0
        end
    end

    def counts
        hash = Hash.new(0)
        self.each {|ele| hash[ele] += 1}
        hash
    end

    def my_count(arg)
        counter = 0
        self.each {|ele| counter += 1 if ele == arg}
        counter
    end

    def my_index(arg)
        idx_arr = []
        self.each_with_index {|ele, i| idx_arr << i if ele == arg}
        if idx_arr.length == 0
            return nil
        else
            return idx_arr[0]
        end
    end

    def my_uniq
        new_arr = []
        self.each {|ele| new_arr << ele if !new_arr.include?(ele)}
        new_arr
    end

    def my_transpose
        new_arr = [] #empty arr
        num_of_arrs = self.length #get num of arrs we're working with
        (0...num_of_arrs).each {|i| new_arr << []} #shovel in num of arrs to our new_arr

        self.each_with_index do |ele1, i1|
            new_arr.each_with_index do |ele2, i2| #for each of our new sub_arrs
                ele1.each_with_index do |e, i|
                    ele2 << e if i2 == i
                end
            end
        end
        new_arr
    end
end
