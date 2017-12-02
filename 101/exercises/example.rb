#write method taking a positive integer and returning the list of digits in that number
def digit_list(number)
  list = number.to_s.split(//)
  list.map { |e| e.to_i }
end

p digit_list(59439)
puts digit_list(444) == [4, 4, 4]
puts digit_list(444) == [4, 4, 5]
