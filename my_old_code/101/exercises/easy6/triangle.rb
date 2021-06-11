# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

def triangle(number)
  space = number
  (1..number).to_a.each do |num|
    puts ('*'*num).rjust(space)
  end
end
