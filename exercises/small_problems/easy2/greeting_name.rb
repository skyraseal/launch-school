# ask for name
# greet name
# if name ends with !, yell.

puts "What is your name?"
name = gets.chomp

if name.include?('!')
  exclamation_suffix = /!+$/.match(name).to_s
  puts "HELLO #{name.delete_suffix(exclamation_suffix).upcase}. WHY ARE WE SCREAMING?#{exclamation_suffix}"
else
  puts "Hello #{name}."
end