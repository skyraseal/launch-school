# Write a method that takes an integer, and converts it to a string representation
# without using Integer#to_s, String(), Kernel#format, etc.
# make it signed

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  type = 'zero'

  if number < 0
    type = "negative"
    number *= -1
  elsif number > 0
    type = "positive"
  end

  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end

  case type
    when 'zero' then result
    when 'negative' then result.prepend("-")
    when 'positive' then result.prepend("+")
  end
end


# Book Solution
# Made a wrapper method that uses the previous method

# def signed_integer_to_string(number)
#   case number <=> 0
#   when -1 then "-#{integer_to_string(-number)}"
#   when +1 then "+#{integer_to_string(number)}"
#   else         integer_to_string(number)
#   end
# end
