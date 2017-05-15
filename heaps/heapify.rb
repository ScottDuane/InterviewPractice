require_relative 'heap'

def heapify(arr)

  heap = Heap.new { |a, b| a <=> b } 
  arr.each do |el|
    heap.insert(el)
  end

  heap
end

h = heapify([1, 2, 3, 2, 4, 10, 0, 5, 1].shuffle!)
puts h.heap.to_s
h.extract_max
puts h.heap.to_s
h.extract_max
puts h.heap.to_s
