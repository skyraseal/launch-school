# can assume numbers are always positive integers

def average(array)
  denominator = array.size.to_f
  numerator = 0

  array.each { |number| numerator += number }

  numerator/denominator
end

# integers have a built in method called #reduce. you can use that isntead of 
# iterating with #each to make it simpler.

def average(numbers)
  sum = numbers.reduce { |sum, number| sum + number }
  sum / numbers.count
end
