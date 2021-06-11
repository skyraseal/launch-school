#Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

def prompt(message)
  puts "==> #{message}"
end

number_array = []

prompt("Enter the 1st number:")
number = gets.chomp.to_i
number_array.push number
prompt("Enter the 2nd number:")
number = gets.chomp.to_i
number_array.push number
prompt("Enter the 3rd number:")
number = gets.chomp.to_i
number_array.push number
prompt("Enter the 4th number:")
number = gets.chomp.to_i
number_array.push number
prompt("Enter the 5th number:")
number = gets.chomp.to_i
number_array.push number

prompt("Enter the last number:")
number = gets.chomp.to_i

if number_array.include?(number)
  puts "The number #{number} appears in #{number_array}."
else
  puts "The number #{number} does not appear in #{number_array}."
end
