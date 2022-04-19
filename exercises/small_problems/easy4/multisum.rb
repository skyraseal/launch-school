def list_multiples(multiple, number) # => return an array
  return_array = []
  multiple_number = multiple

  while multiple_number <= number
    return_array << multiple_number
    multiple_number += multiple
  end

  return_array
end

def multisum(num) # => return a sum
  mult_fives = list_multiples(5, num)
  mult_threes = list_multiples(3, num)

  (mult_fives + mult_threes).uniq.reduce(:+)
end

# the LS solution makes a method that uses modulo to figure out if a number is a multiple
# it then counts iterates through all integers 1 to n with a conditional 
# is it a  multple of 3 or 5? if yes then add to sum.  prevents having to unique the list
