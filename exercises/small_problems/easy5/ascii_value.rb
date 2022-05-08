def ascii_value(string)
  ascii_sum = 0
  ascii_sum += string.chars.map {|char| char.ord}.reduce(:+)
end
