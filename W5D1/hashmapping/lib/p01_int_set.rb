class MaxIntSet
  attr_reader :max, :store

  def initialize(max) #assume they dont give us negative max
    @max = max
    @store = Array.new(max + 1, false)
  end

  def insert(num)
    raise 'Out of bounds' if !is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    raise 'Out of bounds' if !is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    return false if !is_valid?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
    return num >= 0 && num <= max
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num.abs % num_buckets] << num 
  end

  def remove(num)
    n = num.abs % num_buckets
    @store[n].delete(num) if include?(num)
  end

  def include?(num)
    @store[num.abs % num_buckets].include?(num)
  end

  private

  def [](num)
    return @store[num.abs % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !@store[num.abs % num_buckets].include?(num)
      @store[num.abs % num_buckets] << num
      @count += 1 
      if @count > num_buckets
        resize!
      end
    end
  end

  def remove(num)
    n = num.abs % num_buckets
    if include?(num)
      @store[n].delete(num) 
      @count -= 1
    end
  end

  def include?(num)
    @store[num.abs % num_buckets].include?(num)
  end

  private

  def [](num)
    return @store[num.abs % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_num = num_buckets * 2
    a = Array.new(new_num) {Array.new}
    @store.each do |bucket|
      bucket.each do |num|
        a[num.abs % new_num] << num
      end
    end
    @store = a
  end

end
