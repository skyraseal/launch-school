# ask for age
# ask for retirement goal
# display year
# display year of retirement
# display how many years left until retirement
require 'date'

puts "What is your age?"
age = gets.chomp.to_i

puts "What age would you like to retire?"
retirement_age = gets.chomp.to_i

years_until_retirement = retirement_age - age 
this_year = Date.today.year
retirement_year = this_year + years_until_retirement

puts "It's #{this_year}. You will retire in #{retirement_year}.  
You only have #{years_until_retirement} years of work to go!"