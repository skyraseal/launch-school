# method must take two arguments: a string and positive integer
# print the string as many times as integer indicates

def repeat(string, repeats)
  repeats.times {puts string}
end

# could add a check for second parameter to be integer if needed