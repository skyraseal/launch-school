def prompt(message)
  puts "=> #{message}"
end

prompt("What is the bill?")
bill = gets.chomp.to_f
prompt("What is the tip percentage?")
tip_percent = gets.chomp.to_f

tip_amt = bill*tip_percent/100
total = bill + tip_amt

prompt("The tip is #{format("%.2f", tip_amt)}.")
prompt("The total is #{format("%.2f", total)}.")
