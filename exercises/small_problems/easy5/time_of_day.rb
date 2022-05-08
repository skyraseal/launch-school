def time_of_day(mins)
  remainder = mins % 1440

  hours = format("%02d", remainder / 60)
  minutes = format("%02d", remainder % 60)

  "#{hours}:#{minutes}"
end

# refactored
def time_of_day(mins)
  remainder = mins % 1440

  hours, minutes = remainder.divmod(60).map {|num| format("%02d", num)}

  "#{hours}:#{minutes}"
end

def after_midnight(time)
  minutes_array = time.split(":").map { |m| m.to_i }
  minutes = (minutes_array[0]*60 + minutes_array[1]) % 1440
end

def before_midnight(time)
  (1440 - after_midnight(time)) % 1440
end
