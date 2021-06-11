#Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year, or false if it is not a leap year.
#The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, leap years occur in any year that is evenly divisible by 4.

def gregorian?(year)
  year >= 1752
end


def leap_year?(year)
  return 'year less than 0' if year <= 0
  if gregorian?(year)
    if year%400 == 0
      true
    elsif year%100 == 0
      false
    else
      year % 4 == 0
    end
  else
    year % 4 == 0
  end
end

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true
