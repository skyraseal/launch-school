require 'yaml'

MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')
LANGUAGE = 'en'

def prompt(message)
  puts(">> #{message}")
end

def valid_number?(num)
  /^[\-+]?[0-9]?[0-9.]*$/.match?(num) &&
    num.count(".") <= 1 && num.count("0-9") > 0
end

def negative_num?(num)
  /^[\-]/.match?(num)
end

def request_loan_amount
  prompt(MESSAGES[LANGUAGE]['ask_loan_amount'])
  loan_amount = 0

  loop do
    loan_amount = gets.chomp
    break if valid_number?(loan_amount) && !negative_num?(loan_amount)
    prompt(MESSAGES[LANGUAGE]['incorrect_loan_amt_entry'])
  end

  loan_amount
end

def request_loan_apr
  prompt(MESSAGES[LANGUAGE]['ask_loan_apr'])
  loan_apr = 0

  loop do
    loan_apr = gets.chomp
    break if valid_number?(loan_apr) && !negative_num?(loan_apr)
    prompt(MESSAGES[LANGUAGE]['incorrect_loan_apr_entry'])
  end

  loan_apr
end

def request_loan_duration
  prompt(MESSAGES[LANGUAGE]['ask_loan_duration'])
  loan_duration = 0

  loop do
    loan_duration = gets.chomp
    break if valid_number?(loan_duration) && !negative_num?(loan_duration)
    prompt(MESSAGES[LANGUAGE]['incorrect_loan_duration_entry'])
  end

  loan_duration
end

def request_try_again?
  prompt(MESSAGES[LANGUAGE]['try_again'])
  try_again = ''

  loop do
    try_again = gets.chomp.downcase
    break if ['y', 'yes', 'ye', 'n', 'no'].include?(try_again)
    prompt(MESSAGES[LANGUAGE]['incorrect_try_again_entry'])
  end

  ['y', 'ye', 'yes'].include?(try_again)
end

def calc_monthly_mortgage(loan_amount, loan_apr, loan_duration)
  loan_amount = loan_amount.to_f
  loan_apr = loan_apr.to_f / 100
  loan_duration = loan_duration.to_f

  loan_monthly_interest = loan_apr / 12

  if loan_apr == 0
    monthly_mortgage = loan_amount / loan_duration
  else
    monthly_mortgage = loan_amount * (loan_monthly_interest /
      (1 - ((1 + loan_monthly_interest)**-loan_duration)))
  end

  monthly_mortgage.round(2)
end

system("clear")
prompt(MESSAGES[LANGUAGE]['welcome'])
loop do
  loan_amount = request_loan_amount
  loan_apr = request_loan_apr
  loan_duration = request_loan_duration

  # calculate
  prompt(MESSAGES[LANGUAGE]['calculating'])
  monthly_mortgage = calc_monthly_mortgage(loan_amount, loan_apr, loan_duration)
  prompt(MESSAGES[LANGUAGE]['output_result'])
  puts(monthly_mortgage)

  break unless request_try_again?
  system("clear")
end

prompt(MESSAGES[LANGUAGE]['goodbye'])
