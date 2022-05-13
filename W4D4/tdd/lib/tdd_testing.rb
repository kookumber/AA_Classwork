require 'byebug'

def my_uniq(arr)
    new_arr = []
    arr.each {|ele| new_arr << ele if !new_arr.include?(ele)}
    new_arr
    
end

class Array
    def two_sum
        arr = []
        self.each_with_index do |el1, idx1|
            self.each_with_index do |el2, idx2|
                arr << [idx1, idx2] if idx2 > idx1 && el2 + el1 == 0
            end
        end
        arr
    end

    def my_transpose
        arr = []
        self.each_with_index do |subarr, i|
            elements = []
            (0...subarr.length).each do |j|
                elements << self[j][i] 
            end
            arr << elements
        end
        arr
        # self.transpose
    end   
end

def stock_picker(price_arr)
    
    price_arr.sort

    start_arr = price_arr[0] #[1,10]
    end_arr = price_arr[1] 
    price_arr.each do |sub|
        day = sub[0]
        price = sub[1]

        start_arr = sub if day <= end_arr[0] && price < start_arr[1] #good
        end_arr = sub if day > start_arr[0] && price > end_arr[1]
    end

    [start_arr, end_arr]

end



