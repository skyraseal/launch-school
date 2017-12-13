# Write a method that takes a positive integer or zero, and converts it to a string representation
# without using Integer#to_s, String(), Kernel#format, etc.
DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(int)
  power = 0 #alterable values
  base = 10
  q = nil
  number_string = ""

  until q == 0 #Find highest place
    power += 1
    q = int / (base ** power)
  end

  until power == 0 #Start by finding first digit to the last
    power -= 1
    q = int / (base ** power)
    int = int % (base**power)
    number_string << DIGITS[q]
  end

  number_string
end

#Book Solution
#Much cleaner.
#Uses Numeric#divmod which is similar to "a/b" but it returns an array [quotient, modulus] e.g. [a/b, a%b]
#Changes number to the integer quotient. GENIUS!
#Prepends to the result string the remainder. Breaks if there is no further number. note: prepend is a mutator

# DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
#
# def integer_to_string(number)
#   result = ''
#   loop do
#     number, remainder = number.divmod(10)
#     result.prepend(DIGITS[remainder])
#     break if number == 0
#   end
#   result
# end
