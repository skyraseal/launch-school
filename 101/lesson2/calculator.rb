require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}.")

loop do
  prompt(MESSAGES['num1'])
  firstnum = ''
  loop do
    firstnum = Kernel.gets().chomp().to_i()
    if valid_number?(firstnum)
      break
    else
      prompt(MESSAGES['invalid_num'])
    end
  end

  prompt(MESSAGES['num2'])
  secondnum = ''
  loop do
    secondnum = Kernel.gets().chomp().to_i()
    if valid_number?(secondnum)
      break
    else
      prompt(MESSAGES['invalid_num'])
    end
  end

  operator_prompt = <<-MSG
  What type of operation would you like to perform?
  1)add
  2)subtract
  3)multiply
  4)divide
  MSG

  prompt(operator_prompt)
  operation = ''
  loop do
    operation = Kernel.gets().chomp()
    break if %w(1 2 3 4).include?(operation)
    prompt("Must choose a valid operator selection.")
  end

  prompt("#{operation_to_message(operation)} the two numbers...")

  answer =
  if operation == "1"
    firstnum + secondnum
  elsif operation == "2"
    firstnum - secondnum
  elsif operation == "3"
    firstnum * secondnum
  elsif operation == "4"
    firstnum.to_f / secondnum.to_f
  end

  prompt("The result is #{answer}.")
  prompt("Do you want to perform another calculation? (y to calculate again)")
  again = Kernel.gets().chomp()
  break unless again.downcase().start_with?('y')
end

prompt("Thank you for running the calculator.")
