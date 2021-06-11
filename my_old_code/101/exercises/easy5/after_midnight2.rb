# Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

def total_minutes(time_string)
  hours, minutes = time_string.split(":")
  (hours.to_i*60) + minutes.to_i
end

def after_midnight(time_string)
  total_minutes(time_string)%1440
end

def before_midnight(time_string)
  before_midnight = 1440 - total_minutes(time_string)
  before_midnight = 0 if before_midnight == 1440
  before_midnight
end

after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0
