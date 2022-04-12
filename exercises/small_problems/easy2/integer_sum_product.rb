# assuming that user will always input positive integer.
=begin 
def prompt(message)
  puts ">> #{message}"
end

operation_keys = {'s' => 'sum', 'p' => 'product'}
operation_input = ''

prompt("Please enter an integer greater than 0:")
integer_input = gets.chomp.to_i

prompt("Enter 's' to compute the sum 'p' to compute the product:")
loop do 
  operation_input = gets.chomp.downcase
  break if ['s', 'p'].include?(operation_input)
  prompt("Not a valid entry! Enter 's' to compute the sum 'p' to compute the product:")
end

result = nil

if operation_input == 's'
  (1..integer_input).each do |num|
    if !result
      result = num
    else
      result += num 
    end
  end
elsif operation_input == 'p'
  (1..integer_input).each do |num|
    if !result
      result = num
    else
      result *= num 
    end
  end
end

prompt("The #{operation_keys[operation_input]} of the integers between 1 and #{integer_input} is #{result}.")
=end


def prompt(message)
  puts ">> #{message}"
end

def sum_integers(num)
  (1..num).reduce(:+)
end

def product_integers(num)
  (1..num).reduce(:*)
end

operation_keys = {'s' => 'sum', 'p' => 'product'}
operation_input = ''
result = nil

prompt("Please enter an integer greater than 0:")
integer_input = gets.chomp.to_i

prompt("Enter 's' to compute the sum 'p' to compute the product:")
loop do 
  operation_input = gets.chomp.downcase
  break if ['s', 'p'].include?(operation_input)
  prompt("Not a valid entry! Enter 's' to compute the sum 'p' to compute the product:")
end

if operation_input == 's'
  result = sum_integers(integer_input)
elsif operation_input == 'p'
  result = product_integers(integer_input)
end

prompt("The #{operation_keys[operation_input]} of the integers between 1 and #{integer_input} is #{result}.")
