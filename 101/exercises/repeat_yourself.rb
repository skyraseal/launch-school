#write a method that takes two arguments: string & positive integer
#print the string as many times as integer indicates
#check integer
def prompt(message)
  puts ">> #{message}"
end

#this is a method
def repeat(string, number)
  if number.to_i.to_s != number.to_s
    puts "ERROR: Invalid integer <#{number}> specified."
    return
  elsif number < 0
    puts "ERROR for string <#{string}>: #{number} is a negative integer"
  end

  number.times { puts string }
end

repeat("this isn't what you're looking for", 5)
repeat("hey you", -5)
repeat("hey", "you")

#this is a whole program commented out
=begin
prompt("Hi there, welcome to the string repeater program!")
prompt("Please input a string you'd like to repeat:")
repeated_string = gets.chomp
prompt("How many times should the string be repeated? (Please enter a positive integer)")
repeat_number = gets.chomp

loop do
  if repeat_number.to_i.to_s != repeat_number
    prompt("That isn't a valid integer! Please retry:")
    repeat_number = gets.chomp
  elsif repeat_number.to_i < 0
    prompt("Please insert a positive integer instead:")
    repeat_number = gets.chomp
  else
    break
  end
end

prompt("Running string repeater . . .")
repeat_number.to_i.times { puts repeated_string }
prompt("Finished repeat!")
=end
