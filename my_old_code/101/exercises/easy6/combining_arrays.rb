# Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

def merge(array1, array2)
  # merged_array = array1 + array2
  # merged_array.uniq
  array1 | array2 # Array#| which is cleaner. Merges while excluding duplicates.
end
