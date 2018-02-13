# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.
# Do not use the method Array#rotate or Array#rotate! for your implementation.
def rotate_array(array)
  array[1..-1] + array[0]
end

##############################
# Write a method that can rotate the last n digits of a number.
# Note that rotating just 1 digit results in the original number being returned.
def rotate_rightmost_digits(number, count)
  num_string = number.to_s
  split_num = num_string[0..-count - 1], num_string[-count..-1]
  split_num[1] = rotate_array(split_num[1])
  split_num.join.to_i
end

##############################
# Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.
def max_rotation(num)
  rotations = (1..num.to_s.size).to_a.reverse
  rotations.each do |rt_count|
    num = rotate_rightmost_digits(num, rt_count)
  end
  num
end

##############################
# You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.
# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.
def init_lights(switch_amt)
  switch_hsh = Hash.new
  1.upto(switch_amt) do |switch_num| # create the lights
    switch_hsh[switch_num] = 0 # 0 is off, 1 is on
  end
  switch_hsh
end

def light_toggle(light)
  case light
  when 0 then 1
  when 1 then 0
  end
end

def light_switches(switch_amt)
  return 'Error: Must have at least one switch.' if switch_amt < 1
  lights = init_lights(switch_amt)

  (1..switch_amt).to_a.each do |toggle_pattern|
    counter = toggle_pattern
    loop do
      lights[counter] = light_toggle(lights[counter])
      counter += toggle_pattern
      break if counter > switch_amt
    end
  end

  # lights_off = lights.select { |k, v| v == 0 }.keys
  lights_on = lights.select { |k, v| v == 1 }.keys
end
# The returned array always has perfect squares. Why? MIND BLOWING!!!!

##############################
# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.
def diamond(n)
  stars = (1...n).to_a.select { |num| num.odd? }
  all_stars = [stars, n, stars.reverse].flatten
  all_stars.each do |count|
    puts ("*"*count).center(n)
  end
end

##############################
# Write a method that implements a miniature stack-and-register-based programming language that has the following commands:
#     n Place a value n in the "register". Do not modify the stack.
#     PUSH Push the register value on to the stack. Leave the value in the register.
#     ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
#     SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
#     MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
#     DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
#     MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
#     POP Remove the topmost item from the stack and place in register
#     PRINT Print the register value

def minilang(user_input)
  numbers = %w(0 1 2 3 4 5 6 7 8 9 -)
  operations = %w(ADD SUB MULT DIV MOD).map(&:downcase)
  register = 0
  stack = []

  sequence = user_input.split
  sequence.each do |command|
    command = command.downcase
    case
    when command.start_with?(*numbers)
      register = command.to_i
    when operations.include?(command)
      register = cmd_op(stack, register, command)
    when command == 'push'
      stack.push register
    when command == 'pop'
      register = stack.pop
    when command == 'print'
      puts register
    end
  end
end

def cmd_op(stack, register, operation)
  register = case operation.downcase
               when 'add' then register + stack.pop
               when 'sub' then register - stack.pop
               when 'mult' then register * stack.pop
               when 'div' then register / stack.pop
               when 'mod' then register % stack.pop
             end
  register
end

##############################
# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.
def word_to_digit(string)
  numbers = { 'one' => '1', 'two' => '2', 'three' => '3',
              'four' => '4', 'five' => '5', 'six' => '6',
              'seven' => '7', 'eight' => '8', 'nine' => '9',
              'zero' => '0' }
  final_string = string.dup
  numbers.each_key do |number_word|
    final_string.gsub!(" #{number_word}", " #{numbers[number_word]}")
  end
  final_string
end

##############################
# Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.
# ex fibonacci(3) == 2

def fibonacci(n)
  return 1 if n <= 2
  fibonacci(n-2) + fibonacci(n-1)
end

##############################
# Rewrite your recursive fibonacci method so that it computes its results without recursion.

def fibonacci(n)
  prev = 0
  curr = 0
  n.times do
    prev, curr = curr, prev+curr
    curr = 1 if prev == 0
  end
  curr
end

##############################
# In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.
def fibonacci_last(n) #can get very slow with a big n
  fibonacci(n).to_s[-1].to_i
end 

def fibonacci_last(nth) # this will speed things up, as only the last digit is ever needed for all calculations
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  last_2.last
end
