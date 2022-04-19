def short_long_short(string1, string2)
  if string1.length < string2.length
    short = string1
    long = string2
  else
    short = string2
    long = string1
  end

  short + long + short
end