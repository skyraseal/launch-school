def display_teddy_age(name="Teddy")
  puts "=> #{name} is #{rand(20..200)} years old!"
end

def prompt(message)
  puts "=> #{message}"
end

prompt("What is your teddy bear's name?")
name = gets.chomp
if name.empty?
  display_teddy_age
else
  display_teddy_age(name)
end
