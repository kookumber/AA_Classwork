# require 'byebug'
def range(start, last)
    return [] if last <= start
    return [start] if start + 1 == last

    [start] << range(start + 1, last)    
end

# p range(1, 5)
# p range (1, 2)
# p range (1, 3)

def rec_1(b, n)
    return 1 if n == 0
    b * rec_1(b, n - 1)
end

# p rec_1(2, 3) # 8
# p rec_1(2, 4) # 16
# p rec_1(2, 6) # 64

def rec_2(b, n)
    return 1 if n == 0
    return b if n == 1
    if n % 2 == 0
        b * rec_2(b, n - 1)
    else
        b * (rec_2(b, (n - 1) / 2) ** 2)
    end
end

# p rec_2(2, 3) # 8
# p rec_2(2, 4) # 16
# p rec_2(2, 6) # 64

def deep_dup(arr)     
    # dupe_arr = [] #create an empty array so we can shovel in elements of the arr parameter that point to the same object_id
    # arr.each do |ele| #loop through the array
    #     if ele.is_a?(Array) #checks if the element is an Array, if so, shovel it into our dupe_arr
    #         dupe_arr << deep_dup(ele)
    #     else
    #         dupe_arr << ele #if not an array, recursively run through 
    #     end
    # end
    # dupe_arr
    arr.map { |ele| ele.is_a?(Array) ? deep_dup(ele) : ele}
end

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# parts_copy = deep_dup(robot_parts)

# parts_copy[1] << "LEDs"
# p parts_copy
# parts_copy[0] << "bulbs"
# p robot_parts

def fibonacci(n)
    return [0] if n == 1
    return [0, 1] if n == 2
    prev = fibonacci(n - 1) 
    prev << prev[-1] + prev[-2]
end

# p fibonacci(8) # [0, 1, 1]

def bsearch(arr, target)
    mid = arr.length / 2

    return mid if arr[mid] == target
    return nil if arr.length == 0

    left = arr[0...mid]
    right = arr[mid + 1..-1]
    if arr[mid] > target
        bsearch(left, target)
    else
        stack = bsearch(right, target)
        if stack != nil
            bsearch(right, target) + left.length + 1
        else
            return nil
        end
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge(left, right) #[38, 27, 43, 3], [9, 82, 10]
    sorted = []
    until left.empty? || right.empty?
        if left[0] < right[0]
            sorted << left[0]
            left.shift
        else
            sorted << right[0]
            right.shift
        end
    end
    sorted + left + right
end

def merge_sort(arr) # not done
    return [] if arr.length == 0
    return arr if arr.length == 1

    mid = arr.length / 2

    left = arr[0...mid] #[1]
    right = arr[mid..-1] #[2]

    merge(merge_sort(left), merge_sort(right))

end


p merge_sort([1, 2, 66, 4, 10, 3, 5, 33])

# def subsets(arr)
#     return [arr] if arr.length == 0
#     return [[], arr] if arr.length == 1

#     new_arr.unshift(arr)
#     new_arr.unshift(arr.pop)
    
#     subsets(arr).push 

# end

# p subsets([])
# p subsets([1]) #[[], [1]]
# p subsets([1, 2]) #[[], [1], [2], [1,2]]
# subsets([1,2,3]) #[[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

# subsets([1,2,3,4]) = subs([1,2,3]) + [[4], [1, 4], [2, 4], [3, 4], [1, 2, 4], [1, 3, 4], [2, 3, 4], [1, 2, 3, 4]]
# subsets([1,2,3]) = subsets([1, 2]) + [[3], [1, 3], [2, 3], [1, 2, 3]]
# subsets([1,2]) = subets([1]) + [2]
# subsets([1]) = subsets([]) + [1]
# subset([]) = [[]]