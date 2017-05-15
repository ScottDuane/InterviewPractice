class Heap
  attr_accessor :heap

  def initialize(&block)
    @comparator = block
    @heap = []
  end

  def peek
    @heap.first
  end

  def extract_max
    return @heap.pop if @heap.length == 1
    return nil if @heap.length == 0
    max = @heap.first

    @heap[0] = @heap.pop
    parent_idx = 0
    left_child_idx = 1
    right_child_idx = 2

    heapify_down
    max
  end

  def insert(val)
    @heap << val
    child_idx = @heap.length - 1
    parent_idx = child_idx % 2 == 0 ? (child_idx - 2)/2 : (child_idx - 1)/2
    while @comparator.call(@heap[parent_idx], @heap[child_idx]) < 0
      @heap[parent_idx], @heap[child_idx] = @heap[child_idx], @heap[parent_idx]
      child_idx = parent_idx
      break if child_idx == 0
      parent_idx = child_idx % 2 == 0 ? (child_idx - 2)/2 : (child_idx - 1)/2
    end
  end

  def heapify_down
    parent_idx = 0
    left_child_idx = 1
    right_child_idx = 2
    root = @heap[0]
    # Not DRY -- fix later
    while true
      if left_child_idx < @heap.length && right_child_idx < @heap.length
        left_greater = @comparator.call(@heap[parent_idx], @heap[left_child_idx]) < 0
        right_greater = @comparator.call(@heap[parent_idx], @heap[right_child_idx]) < 0

        if left_greater && right_greater
          if @comparator.call(@heap[left_child_idx], @heap[right_child_idx]) < 0
            @heap[parent_idx], @heap[right_child_idx] = @heap[right_child_idx], @heap[parent_idx]
            parent_idx = right_child_idx
          else
            @heap[parent_idx], @heap[left_child_idx] = @heap[left_child_idx], @heap[parent_idx]
            parent_idx = left_child_idx
          end
          left_child_idx = 2*parent_idx+1
          right_child_idx = 2*parent_idx+2
        elsif left_greater
          @heap[parent_idx], @heap[left_child_idx] = @heap[left_child_idx], @heap[parent_idx]
          parent_idx = left_child_idx
          left_child_idx = 2*parent_idx+1
          right_child_idx = 2*parent_idx+2
        elsif right_greater
          @heap[parent_idx], @heap[right_child_idx] = @heap[right_child_idx], @heap[parent_idx]
          parent_idx = right_child_idx
          left_child_idx = 2*parent_idx+1
          right_child_idx = 2*parent_idx+2
        else
          return root
        end
      elsif @heap.length > left_child_idx && @comparator.call(@heap[parent_idx], @heap[left_child_idx]) < 0
        @heap[parent_idx], @heap[left_child_idx] = @heap[left_child_idx], @heap[parent_idx]
        parent_idx = left_child_idx
        left_child_idx = 2*parent_idx+1
        right_child_idx = 2*parent_idx+2
      else
        return root
      end
    end
  end
end
