# The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.
# Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.
# You may not use ruby's Date and Time classes.

def time_of_day(minutes_away)
  if minutes_away < 0
    time_in_mins = (1440 + minutes_away) % 1440
  else
    time_in_mins = (minutes_away) % 1440
  end

  hours, minutes = time_in_mins.divmod(60)
  time_of_day = "#{format("%02d:%02d", hours, minutes)}"  # %02d '0' flag for padding with 0; 2 for width; no precision; d-type for decimal number
end

time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

# Book solution
# Very surprised as to how 'modulus' (%) works with negative values. It will keep adding the second number to the first number until a positive remainder is given.
# In this case, '1440' was added to '-3' to get a remainder of '1437'.
# Makes it unnecessary to use if/else for positive/negative arguments.

# MINUTES_PER_HOUR = 60
# HOURS_PER_DAY = 24
# MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR
#
# def time_of_day(delta_minutes)
#   delta_minutes =  delta_minutes % MINUTES_PER_DAY
#   hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
#   format('%02d:%02d', hours, minutes)
# end
