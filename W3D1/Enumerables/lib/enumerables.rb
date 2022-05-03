require "byebug"

class Array

    def my_each(&prc)
        i = 0
        
        while i < self.length
            prc.call(self[i])
            i += 1
        end

        self
    end

    def my_select(&prc)
        arr = []
        self.my_each { |ele| arr << ele if prc.call(ele) }
        arr
    end

    def my_reject(&prc)
        arr = []
        self.each { |ele| arr << ele if !prc.call(ele) }
        arr
    end
    
    def my_any?(&prc)
        self.each do |ele| 
            if prc.call(ele)
                return true
            end
        end
        false
    end

    def my_all?(&prc)
        count = 0
        self.each { |ele| count += 1 if prc.call(ele) }
        count == self.length
    end

    def my_flatten
        arr = []
        self.each_with_index do |ele, i|
            if ele.is_a?(Array)
                arr += ele.my_flatten
            else
                arr += [ele]
            end
        end
        arr
    end

    def my_zip(*args)
        new_arr = Array.new(self.length) { Array.new() }
        
        self.each_with_index do |ele, i|
            new_arr[i] << ele
        end
      
        new_arr.each_with_index do |ele1, i1|
            args.each do |sub_arr|
                sub_arr.each_with_index do |ele2, i2|
                    if i2 == i1
                        ele1 << ele2
                    end
                end
            end
        end

        new_arr.each do |sub|
            while sub.length < args.length + 1
                sub << nil
            end
        end

        new_arr
    end

    # def my_rotate(num = 1)
    #     self.each_with_index do |ele, i|
    #         self[i] = self[(i + num) % self.length]
    #     end
    # end

    def my_rotate(num = 1)
        copy = []
        self.each { |ele| copy << ele }
        while num > 0
            temp = copy.shift
            copy.push(temp)
            num -= 1
        end

        while num < 0
            temp = copy.pop
            copy.unshift(temp)
            num += 1
        end
        copy
    end

    def my_join(str = "")
        new_string = ""
        self.each_with_index do |ele, i|
            if i == self.length - 1
                new_string += ele.to_s
            else
                new_string += ele.to_s + str
            end
        end

        new_string
    end

    def my_reverse
        arr = []
        self.each { |ele| arr.unshift(ele) }
        arr
    end

end

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]