def sum(n)
  n.to_s.split('').map {|digit| digit.to_i}.reduce(:+)
end