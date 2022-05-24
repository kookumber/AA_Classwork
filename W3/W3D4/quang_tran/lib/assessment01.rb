class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    accumlator = self[0] if accumulator == nil
  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  return false if num < 2
  (2...num).each do |i|
    if num % i == 0
      return false
    end
  end
  true
end

def primes(num)
  return [] if num == 0
  arr = []
  (2..50).each { |i| arr << i if is_prime?(i) == true}
  arr[0...num]
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
    return [1] if num == 1
    return [1, 1] if num == 2
  
    factorials_rec(num - 1) << factorials(num) 
end

def factorials(num)
  return 1 if num == 1
  return 2 if num == 2

  num * factorials(num - 1)
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new {|k, v| k[v] = []}
    self.each_with_index do |ele, i|
      hash[ele] << i
    end
    hash.select {|k, v| v.length > 1}
  end

end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    subs = substrings(self)
    arr = []
    subs.each {|sub| arr << sub if is_palindrome?(sub)}
    arr
  end

  def is_palindrome?(string)
    string.reverse == string
  end

  def substrings(word)
    arr = []
    word.each_char.with_index do |ele1, idx1|
      word.each_char.with_index do |ele2, idx2|
        if idx2 > idx1
          arr << word[idx1..idx2]
        end
      end
    end
    arr
  end

end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
    len = self.length
    mid = len / 2
    return self if len == 0 || len == 1 
  
  end

  def merge(left, right)
  end

  private
  def self.merge(left, right, &prc)
  end
end

