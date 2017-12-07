#still incomplete.  Unit choice not working.  Meters only.
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

unit_keys = {1 => "meters", 2 => "feet"}

prompt("Welcome to the room area calculator!")
prompt("What unit of measurement do you wish to use?\n(1) meters\n(2) feet")
loop do
  input = gets.chomp.to_i
  options_list = unit_keys.each_pair { |k, v| "(#{k}): #{v}"}
  if unit_keys.has_key?(input)
    break
  else
    prompt("Invalid entry. Please choose the following options: #{options_list}")
  end
end


prompt("Enter the length of the room in meters:")
length = gets.chomp.to_f

prompt("Enter the width of the room in meters:")
width = gets.chomp.to_f

prompt("The area of the room is #{room_area(length, width)} square meters (#{(room_area(length, width)*10.7639).round(2)} square feet).")
