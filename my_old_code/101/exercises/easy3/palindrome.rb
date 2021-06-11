#Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.

def alphanumeric?(argument)
  %w(a b c d e f g h i j k l m n o p q r s t u v 1 2 3 4 5 6 7 8 9 0).include?(argument.downcase)
end

def alphanumeric_only(argument)
  alpha_only = argument.split(//).select{|character| alphanumeric?(character)}
  alpha_only = alpha_only.join
end

def palindrome?(argument)
  argument == argument.reverse
end

def real_palindrome?(argument)
  palindrome?(alphanumeric_only(argument.downcase))
end

def palindromic_number?(number)
  real_palindrome?(number.to_s)
end

# real_palindrome?("Madam, I'm Adam") == true

#Book solution using string#delete method.
#def real_palindrome?(string)
#  string = string.downcase.delete('^a-z0-9')
#  palindrome?(string)
#end
