# frozen_string_literal: true

def merge(left, right, arr_merged, left_index, right_index)
  loop do
    if left[left_index] < right[right_index]
      arr_merged << left[left_index]
      left_index += 1
    else
      arr_merged << right[right_index]
      right_index += 1
    end
    array_end_reached = left_index == left.length || right_index == right.length
    break arr_merged + left[left_index..-1] + right[right_index..-1] if array_end_reached
  end
end

def merge_sort(arr)
  return arr if arr.length < 2

  mid_arr = arr.length / 2
  left = merge_sort(arr[0...mid_arr])
  right = merge_sort(arr[mid_arr..-1])

  merge(left, right, [], 0, 0)
end

p merge_sort([1, 2, 5, 8, 3, 0, 7, 4])
p merge_sort([-1, 3, 2, 5, -8, 3, 0, 7, 5, 4])
p merge_sort([2, 1, 4, 3])
p merge_sort([4, 1, 2])
p merge_sort([0, 0, 0, 0, 0, 0])
p merge_sort([])
