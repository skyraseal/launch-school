def prompt(message)
  puts "=> #{message}"
end

prompt("What is your age?")
age = gets.chomp.to_i

prompt("What age would you like to retire at?")
retire_age = gets.chomp.to_i

year = Time.now.year
yrs_til_retire = retire_age - age

prompt("It's only #{year}.  You can retire in #{year+yrs_til_retire}!")
prompt("#{yrs_til_retire} years of work to go!")
