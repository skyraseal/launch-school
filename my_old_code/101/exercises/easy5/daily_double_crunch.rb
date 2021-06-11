# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.
# Warning: each_char returns original string rather than the result. Which is why we make sure that the new string is returned.

def crunch(string)
  new_string = ""

  string.each_char do |chr|
    if new_string[-1] != chr
      new_string << chr
    end
  end

  new_string
end

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''
