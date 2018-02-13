# Write a method that takes an Array as an argument, and returns two Arrays that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

def halvsies(array)
  half_way = array.size.even? ? (array.size/2) : (array.size/2)+1
  first_half = array.slice(0, half_way)
  second_half = array.slice(half_way, half_way)
  [first_half, second_half]
end



  
