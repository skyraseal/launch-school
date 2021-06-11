#My method
=begin
def stringy(num)
  patterned_string = ""
  counter = 0
  until num == counter
    if counter % 2 == 0
      patterned_string << "1"
    else
      patterned_string << "0"
    end
    counter += 1
  end
  patterned_string
end
=end

#book method
#uses .even? method on  the index number of the .times method
def stringy(size)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
