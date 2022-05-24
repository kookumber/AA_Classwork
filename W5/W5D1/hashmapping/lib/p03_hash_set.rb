require_relative "p02_hashing.rb"

class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !@store[num.hash % num_buckets].include?(num)
      @store[num.hash % num_buckets] << num
      @count += 1 
      if @count > num_buckets
        resize!
      end
    end
  end

  def remove(num)
    n = num.hash % num_buckets
    if include?(num)
      @store[n].delete(num) 
      @count -= 1
    end
  end

  def include?(num)
    @store[num.hash % num_buckets].include?(num)
  end

  private

  def [](num)
    return @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_num = num_buckets * 2
    a = Array.new(new_num) {Array.new}
    @store.each do |bucket|
      bucket.each do |num|
        a[num.hash % new_num] << num
      end
    end
    @store = a
  end

end
