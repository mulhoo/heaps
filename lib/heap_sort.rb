

# This method uses a heap to sort an array.
# Time Complexity:  o1
# Space Complexity: on
def heapsort(list)
  heap = MinHeap.new
  result = []
  
  list.each do |val|
    heap.add(val, val)
  end

  result << heap.remove until heap.empty?
  
  return result
end