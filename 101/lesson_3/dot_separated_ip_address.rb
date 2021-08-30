def valid_ipv4_subnumber?(number)
  (0..255).include?(number)
end

def dot_separated_ip_address?(input_string)
  separated_numbers = input_string.split(".")
  return false unless separated_numbers.size == 4

  while separated_numbers.size > 0 do
    number = separated_numbers.pop.to_i
    return false unless valid_ipv4_subnumber?(number)
  end

  true
end
