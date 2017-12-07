def prompt(message)
  puts "=> #{message}"
end

prompt("What is your name?")
name = gets.chomp

if name.include?("!")
  prompt("HELLO #{name.upcase.chomp("!")}. WHY ARE WE SCREAMING?")
else
  prompt("Hello #{name}.")
end
