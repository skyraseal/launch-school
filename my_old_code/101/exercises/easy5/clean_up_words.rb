# Given a string that consists of some words and an assortment of non-alphabetic characters
# write a method that returns that string with all of the non-alphabetic characters replaced by spaces.
# If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).


def alphanumeric?(argument)
  %w(a b c d e f g h i j k l m n o p q r s t u v w x y z 1 2 3 4 5 6 7 8 9 0).include?(argument.downcase)
end

def cleanup(dirty_string)
  clean_characters = dirty_string.chars.map do |char|
    alphanumeric?(char) ? char : " "
  end

  clean_string = String.new
  for e in clean_characters do
    clean_string << e unless clean_string[-1] == " " && e == " "
  end
  clean_string
end

cleanup("---what's my +*& line?") == ' what s my line '

#Book solution
#Used String#gsub and String#squeeze.  If only I knew aobut #squeeze!
#Used regex for gsub
#Note: Learn regex and String methods better

# def cleanup(text)
#   text.gsub(/[^a-z]/i, ' ').squeeze(' ')
# end
