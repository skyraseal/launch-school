#My method
=begin
def average(array)
  total = 0
  array.each do |num|
    total += num
  end
  average = total/array.length
end
=end

#Book method
#uses reduce method from enumerable which |memorises, takes|
#count method is similar to length
def average(numbers)
  sum = numbers.reduce { |sum, number| sum + number }
  sum.to_f / numbers.count
end

puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])
