require "byebug"

class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  # include Enumerable

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil

  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    
  end
end

class LinkedList

include Enumerable

  attr_reader :tail, :head
  def initialize
    @head = Node.new()
    @tail = Node.new()

    @head.next = @tail
    @tail.prev = @head
    @count = 0
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    return @head.next
  end

  def last
    return @tail.prev
  end

  def empty?
    return @count == 0
  end

  def get(key) #target
    pointer = @head.next

    while pointer != @tail
      if pointer.key == key
        return pointer.val
      else
        #iterate to the node after the one pointer is currently pointing at
        pointer = pointer.next
      end
    end

    return nil

  end

  def include?(key)
    pointer = @head.next

    while pointer != @tail
      if pointer.key == key
        return true
      else
        #iterate to the node after the one pointer is currently pointing at
        pointer = pointer.next
      end
    end
    return false
  end

  def append(key, val)
    prev_node = @tail.prev
    
    new_node = Node.new(key, val) #B
    new_node.next = @tail 
    new_node.prev = prev_node 
    prev_node.next = new_node
    @tail.prev = new_node
    @count += 1
    
  end

  def update(key, val)
    pointer = @head.next

    while pointer != @tail
      if pointer.key == key
        pointer.val = val
        return
      else
        #iterate to the node after the one pointer is currently pointing at
        pointer = pointer.next
      end
    end
  end

  def remove(key)

    pointer = @head.next
    
    while pointer != @tail
      if pointer.key == key #found node to remove
        left = pointer.prev #placeholders for left and right of pointer, which is the node we want to delete
        right = pointer.next
        left.next = right 
        right.prev = left
        pointer.prev = nil
        pointer.next = nil
        return
      else
        pointer = pointer.next
      end
    end

  end

  def each(&prc)
    pointer = @head.next

    while pointer != @tail
      prc.call(pointer)
      pointer = pointer.next
    end
  end

  #uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
