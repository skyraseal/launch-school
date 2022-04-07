# method should take one argument (positive integer)
# should return a list of digits in the number
# string-wise thinking

def digit_list(number)
  list = []
  number.to_s.split('').each do |digit|
    list << digit.to_i 
  end

  list
end

# the better way
def digit_list(number)
  number.to_s.chars.map(|digit| digit.to_i)
end
