#is_odd?

#my definition
def is_odd?(number)
  if number % 2 != 0
    true
  else
    false
  end
end

puts is_odd?(6)
puts is_odd?(3)

#cleaner definition, returns true/false in one line
def is_odd2?(number)
  number % 2 == 1
end

#using remainder instead of modulus
def is_odd_remainder?(number)
  number.remainder(2) == 1
end

puts is_odd_remainder?(6)
puts is_odd_remainder?(3)
