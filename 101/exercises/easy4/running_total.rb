# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

def running_total(number_array)
  adding_number = 0
  running_array = []
  number_array.each do |current|
    new_num = current + adding_number
    running_array << new_num
    
    adding_number = adding_number + current
  end
  running_array
end

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []
