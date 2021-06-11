# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).
# You may assume that the number passed in is an integer greater than 1.

def mult3(num)
  (1..num).to_a.select! {|x| x % 3 == 0}
end

def mult5(num)
  (1..num).to_a.select! {|x| x % 5 == 0}
end

def multisum(num)
  multiples_array = mult3(num) + mult5(num)
  multiples_array.uniq!

  total = 0
  multiples_array.each {|element| total += element}
  total
end

multisum(3)
multisum(5)
multisum(10)
multisum(1000)
