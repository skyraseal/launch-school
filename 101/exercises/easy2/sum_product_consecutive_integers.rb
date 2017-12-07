def prompt(message)
  puts "=> #{message}"
end

def consecutive_sum(last_number)
  number = 1
  total = 0
  until number > last_number do
    total += number
    number += 1
  end
  total
end

def consecutive_prd(last_number)
  number = 1
  total = 1
  until number > last_number do
    total *= number
    number += 1
  end
  total
end

number = ''
until %w(0 1 2 3 4 5 6 7 8 9).include?(number[0])
  prompt("Please enter an integer greater than 0:")
  number = gets.chomp
end
number = number.to_i

operation = ''
until %w(s p).include?(operation)
  prompt("Enter 's' to compute the sum, 'p' to compute the product.")
  operation = gets.chomp.downcase
end

if operation == "s"
  prompt("The sum of integers between 1 and #{number} is #{consecutive_sum(number)}")
elsif operation == "p"
  prompt("The product of integers between 1 and #{number} is #{consecutive_prd(number)}")
end
