puts "Room area calculator"
puts "The length and width of the room in meters will be asked."
puts "What is the room length?"
length = gets.chomp
puts "What is the room width?"
width = gets.chomp

area_m = length.to_f * width.to_f
area_ft = area_m * 10.7639
puts "The area of the room is #{area_m.round(2)} square meters (#{area_ft.round(2)} square ft)."