require_relative 'heap'

# PROBLEM: given an array that is k-sorted (each element is at most k positions away from its sorted position),
# sort this array in better than O(n log n) time and O(n) space

def k_sorted(arr, k)
  n = arr.length
  sorted = []

  (0...n-k).each do |i|
    heap = Heap.new { |a, b| b <=> a }
    k.times do |j|
      heap.insert(arr[k*i + j])
    end

    puts "here is the slice: #{heap.heap}"
    k.times do |m|
      arr[i*k+m] << heap.extract_max
    end
  end

  arr
end

puts k_sorted([1, 0, 2, 3, 4], 2).to_s
