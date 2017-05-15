require_relative 'heap'

# PROBLEM: given a set of sorted lists, merge the list into one big sorted list.
# Example: merge_sorted_lists([1, 1, 2], [0, 4], [0, 2, 6, 6]) -> [0, 0, 1, 1, 2, 2, 4, 6, 6]

def merge_sorted_lists(lists)
  heap = Heap.new { |a, b| b.first <=> a.first }
  lists.each do |list|
    heap.insert(list)
  end

  sorted = []
  while heap.heap.length > 0
    min = heap.peek.shift
    sorted.unshift(min)
    if heap.peek.length == 0
      heap.extract_max
    else
      heap.heapify_down
    end
  end

  sorted
end

def heapsort(heap)
  sorted = []
  while heap.heap.length > 0
    next_thing = heap.extract_max
    puts "the next thing: #{next_thing}"
    sorted.unshift(next_thing)

  end
  sorted
end

puts "merged lists: #{merge_sorted_lists([[1, 1, 2], [0, 4], [0, 2, 6, 6]])}"
