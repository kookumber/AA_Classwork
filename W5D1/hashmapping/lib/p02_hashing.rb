class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash #[], #[[]]
    num = 0
    self.each_with_index do |ele, i|
      num += ele.hash * (i + 1)
    end
    return num
  end
end

class String
  def hash
    num = 0
    self.each_char.with_index do |char, i|
      num += char.ord * (i + 1)
    end
    return num
  end

end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    num = 0
    self.each do |k, v|
      num += k.hash.hash * v.hash
    end
    return num
  end
end

# (0..10).each do |num|
#   p num.hash
# end
