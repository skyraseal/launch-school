#Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

def prompt(message)
  puts "==> #{message}"
end

prompt("Please write a word or multiple words:")
user_string = gets.chomp

mod_user_string = user_string.split.join #can use String#delete instead and String#size
characters = mod_user_string.length

puts "There are #{characters} charcters in \"#{user_string}\"."
