# Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds.
# You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

# def dms(angle)
#   degrees = angle.to_i
#   minutes = ((angle - angle.to_i) * 60).to_i
#   seconds = ((((angle - angle.to_i) * 60) - minutes) * 60).to_i
#
#
#   degrees.to_s + DEGREE + format("%02d'", minutes) + format("%02d", seconds) + '"'
# end

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE)
  total_seconds *= -1 if degrees_float < 0
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)

  if degrees_float >= 0
    format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
  else
    format(%(-#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
  end
end
