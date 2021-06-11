# Write a method named include? that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

def include?(array, query)
  counter = 0
  included = false
  array.each do |element|
    if element == query
      included = true
      break
    end
  end

  included
end
