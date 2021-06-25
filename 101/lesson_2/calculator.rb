# ask the user for two numbers
# ask the user for the operation
# display the result

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def narrate(converse)
  Kernel.puts("=> #{converse}")
end

def valid_number?(num)
  trim_num = num.gsub(/\s/, '')
  trim_num == trim_num.to_i.to_s || trim_num == trim_num.to_f.to_s 
end

def operation_to_message(op)
  case op
  when 1
    MESSAGES['adding']
  when 2
    MESSAGES['subtracting']
  when 3
    MESSAGES['multiplying']
  when 4
    MESSAGES['dividing']
  end
end

narrate(MESSAGES['welcome'])
narrate(MESSAGES['direction'])

narrate(MESSAGES['ask_name'])
name = ""
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES['invalid_name'])
  else
    break
  end
end

narrate(MESSAGES['greet_name']+"#{name}!")

loop do
  number1 = 0
  number2 = 0

  loop do
    narrate(MESSAGES['ask_first_number'])
    number1 = Kernel.gets().chomp()
    break if valid_number?(number1)
    narrate(MESSAGES['invalid_number'])
  end

  loop do
    narrate(MESSAGES['ask_second_number'])
    number2 = Kernel.gets().chomp()
    break if valid_number?(number2)
    narrate(MESSAGES['invalid_number'])
  end

  narrate(MESSAGES['which_operation'])

  operation = nil
  loop do
    operation = Kernel.gets().chomp().to_i
    break if [1, 2, 3, 4].include?(operation)
    narrate(MESSAGES['invalid_operation'])
  end

  result =
    case operation
    when 1
      number1.to_i() + number2.to_i()
    when 2
      number1.to_i() - number2.to_i()
    when 3
      number1.to_i() * number2.to_i()
    when 4
      number1.to_f() / number2.to_f()
    end

  narrate(operation_to_message(operation))
  narrate(MESSAGES['result']+"#{result}")

  narrate(MESSAGES['perform_again'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
