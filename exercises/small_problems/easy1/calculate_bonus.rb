# take two arguments, a salary (integer) and bonus (boolean)
# if bonus is true, return half of the salary

def calculate_bonus(salary, bonus=true)
  if bonus
    salary/2
  else 
    0
  end
end