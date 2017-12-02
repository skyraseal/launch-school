# Mortgage / Car Loan Calculator

# METHODS
require 'yaml'
MESSAGES = YAML.load_file("mortgage_calculator_messages.yml")

def prompt(message)
  Kernel.puts("==> #{message}")
end

def float?(input)
  input.to_f().to_s() == input
end

def integer?(input)
  input.to_i().to_s() == input
end

def number?(input)
  integer?(input) || float?(input)
end

def number_input
  input = nil
  loop do
    input = Kernel.gets().chomp()
    if number?(input)
      break
    else
      prompt(MESSAGES['invalid'])
    end
  end

  if integer?(input)
    input = input.to_i()
  else
    input = input.to_f()
  end
end

# START OF CODE
prompt(MESSAGES['welcome'])
prompt(MESSAGES['explanation'])

prompt(MESSAGES['ask_loan_amount'])
loan_amount = number_input

prompt(MESSAGES['ask_apr'])
apr = number_input
monthly_interest = apr.to_f()/12/100

prompt(MESSAGES['ask_loan_duration'])
loan_duration = number_input

monthly_payment = loan_amount * (monthly_interest / (1-(1+monthly_interest)**(-loan_duration)))
m_payment_round = monthly_payment.round(2)

prompt(MESSAGES['monthly_payment'] + "#{m_payment_round}")
