#Works, but incomplete incorporation of methods.
CONVERSION = 10.7639

def prompt(message)
  puts "=> #{message}"
end

def room_area(length, width)
  area = length * width
end

def sqmt_to_sqft(sqmt)
  sqmt*CONVERSION
end

def sqft_to_sqmt(sqft)
  sqft/CONVERSION
end


prompt("Welcome to the room area calculator!")
prompt("What unit of measurement do you wish to use?\n(1) meters\n(2) feet\n(Please enter the appropriate choice number)")
unit_choice = gets.chomp.to_i

if unit_choice == 1
  prompt("Enter the length of the room in meters:")
  length = gets.chomp.to_f

  prompt("Enter the width of the room in meters:")
  width = gets.chomp.to_f

  prompt("The area of the room is #{room_area(length, width)} square meters (#{(room_area(length, width)*10.7639).round(2)} square feet).")

elsif unit_choice == 2
  prompt("Enter the length of the room in feet:")
  length = gets.chomp.to_f

  prompt("Enter the width of the room in feet:")
  width = gets.chomp.to_f

  prompt("The area of the room is #{room_area(length, width)} square feet (#{(room_area(length, width)/10.7639).round(2)} square meters).")
end
