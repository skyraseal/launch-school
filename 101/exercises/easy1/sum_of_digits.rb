#My method
=begin
def sum(num)
  array = num.to_s.split(//)
  array_to_i = array.map {|digit| digit.to_i}
  sum = array_to_i.reduce {|sum, number| sum + number}
end
=end

#book method
#everything I did but simpler
def sum(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
