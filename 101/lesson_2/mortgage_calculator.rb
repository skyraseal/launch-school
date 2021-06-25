require 'yaml'

MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')
LANGUAGE = 'en'

def prompt(message)
  Kernel.puts(">> #{message}")
end

def valid_number?(num)
  /^[\-+]?[0-9]?[0-9.]*$/.match?(num) && num.count(".") <= 1 && num.count("0-9") > 0
end

def request_loan_amount
  prompt(MESSAGES[LANGUAGE]['ask_loan_amount'])
  loan_amount = 0

  loop do
    loan_amount = Kernel.gets().chomp()
    break if valid_number?(loan_amount)
    prompt(MESSAGES[LANGUAGE]['incorrect_loan_amt_entry'])
  end

  loan_amount
end

def request_loan_apr
  prompt(MESSAGES[LANGUAGE]['ask_loan_apr'])
  loan_apr = 0

  loop do
    loan_apr = Kernel.gets().chomp()
    break if valid_number?(loan_apr)
    prompt(MESSAGES[LANGUAGE]['incorrect_loan_apr_entry'])
  end

  loan_apr
end

def request_loan_duration
  prompt(MESSAGES[LANGUAGE]['ask_loan_duration'])
  loan_duration = 0

  loop do
    loan_duration = Kernel.gets().chomp()
    break if valid_number?(loan_duration)
    prompt(MESSAGES[LANGUAGE]['incorrect_loan_duration_entry'])
  end

  loan_duration
end

def request_try_again
  prompt(MESSAGES[LANGUAGE]['try_again'])
  try_again = gets.chomp.downcase

  ['y', 'yes'].include?(try_again)
end

def calc_monthly_mortgage(loan_amount, loan_apr, loan_duration)
  loan_amount = loan_amount.to_f
  loan_apr = loan_apr.to_f / 100
  loan_duration = loan_duration.to_f

  loan_monthly_interest = loan_apr / 12

  monthly_mortgage = loan_amount * (loan_monthly_interest / (1 - ((1 + loan_monthly_interest)**-loan_duration)))
  monthly_mortgage.round(2)
end

loan_amount = 0
loan_apr = 0
loan_duration = 0
monthly_mortgage = 0

prompt(MESSAGES[LANGUAGE]['welcome'])
loop do
  loan_amount = request_loan_amount
  loan_apr = request_loan_apr
  loan_duration = request_loan_duration

  # calculate
  prompt(MESSAGES[LANGUAGE]['calculating'])
  monthly_mortgage = calc_monthly_mortgage(loan_amount, loan_apr, loan_duration)
  prompt(MESSAGES[LANGUAGE]['output_result'])
  Kernel.puts(monthly_mortgage)

  break unless request_try_again
end

prompt(MESSAGES[LANGUAGE]['goodbye'])
