DIGITS = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' }

def integer_to_string(num)
  string = ''

  loop do 
    string.prepend DIGITS[num%10]
    num /= 10
    break if num == 0
  end

  string 
end

def signed_integer_to_string(num)
  case
  when num < 0 then '-'+integer_to_string(num.abs)
  when num > 0 then '+'+integer_to_string(num)
  else 0
  end
end