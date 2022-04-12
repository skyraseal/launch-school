def palindrome?(string)
  string == string.reverse
end

def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

def palindromic_number?(number)
  palindrome?(number.to_s)
end