CURRENCY_SIGN = '$'

puts "What's the bill amount?"
bill = gets.chomp.to_f
puts "What's the tip percentage?"
tip_percent = gets.chomp.to_f

tip_amt = bill * tip_percent / 100.0
total = bill + tip_amt

puts "The tip is #{CURRENCY_SIGN}#{format('%0.2f',tip_amt)}"
puts  "The total is #{CURRENCY_SIGN}#{format('%0.2f',total)}"