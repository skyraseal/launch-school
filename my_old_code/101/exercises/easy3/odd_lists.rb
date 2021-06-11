# Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

def every_other_odd(array)
  odds_array = []
  counter = 1
  array.each do |item|
    if counter % 2 != 0
      odds_array << item
    end
    counter += 1
  end

  odds_array
end
