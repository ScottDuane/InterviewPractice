require_relative 'heap'
require_relative 'merge_sorted_lists'

# PROBLEM: an array is k-increasing-decreasing if it increases for some number of elements, then decreases, then
# increases, etc., a total of k times. Write a method to sort such an array.

# Approach: use merge_sorted_lists as a helper method, viewing this as k sorted arrays which must be combined.
def k_inc_dec(arr)
  subseq_start = 0
  subseq_stop = 0
  lists = []

  while subseq_stop < arr.length
    increasing = arr[0] < arr[1]
    if increasing
      while arr[subseq_stop+1] && arr[subseq_stop] < arr[subseq_stop+1]
        subseq_stop += 1
      end
      lists << arr[subseq_start..subseq_stop]
    else
      while arr[subseq_stop+1] && arr[subseq_stop] > arr[subseq_stop + 1]
        subseq_stop += 1
      end
      lists << arr[subseq_start..subseq_stop].reverse!
    end

    subseq_start = subseq_stop + 1
    subseq_stop += 1
  end

  merge_sorted_lists(lists)
end

puts k_inc_dec([1, 2, 3, 9, 5, 4, 6, 7, 10, 11, 1, 0])
