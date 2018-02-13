# Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list. 

def reverse!(list)
  left_index = 0
  right_index = -1
  swap_times = list.size/2

  swap_times.times do
    list[left_index], list[right_index] = list[right_index], list[left_index]
    left_index += 1
    right_index -= 1
  end

  list
end

def reverse(list)
  new_list = list.dup
  reversed_list = []
  list_size = new_list.size

  list_size.times do
    reversed_list << new_list.pop
  end

  reversed_list
end
