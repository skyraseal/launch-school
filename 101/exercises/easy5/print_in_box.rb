# Write a method that will take a short line of text, and print it within a box.

def print_in_box(string)
  puts "+-#{"-"*string.length}-+"
  puts "| #{" "*string.length} |"
  puts "| #{string} |"
  puts "| #{" "*string.length} |"
  puts "+-#{"-"*string.length}-+"
end


print_in_box("yo momma joke")
