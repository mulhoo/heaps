class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap
  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity:ologn
  # Space Complexity: o1
  def add(key, value = key)
    @store << HeapNode.new(key, value)

    return heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity:ologn
  # Space Complexity: o1
  def remove()
    return nil if @store.empty?

    swap(0, @store.length - 1)
    removed = @store.pop

    heap_down(0) #unless @store.empty?
    return removed.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: o1
  # Space complexity: o1
  def empty?
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: o1
  # Space complexity: o1
  def heap_up(index)
    return if index == 0
    
    parent = (index - 1 ) / 2

    if @store[parent].key > @store[index].key
      swap(parent, index)
      return heap_up(parent) while parent > 0 
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    child_index_left = (index * 2) + 1
    child_index_right = (index * 2) + 2
    
    if @store[child_index_left].nil?
      return
    elsif @store[child_index_right].nil?
      if @store[child_index_left].key < @store[index].key 
        swap(index, child_index_left)
      end
      return
    end

    if @store[child_index_left].key < @store[child_index_right].key
      swap(index, child_index_left)
      heap_down(child_index_left)
    else
      swap(index, child_index_right)
      heap_down(child_index_right)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end