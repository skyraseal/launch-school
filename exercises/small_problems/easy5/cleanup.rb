def cleanup(string)
  string.gsub(/[^a-zA-Z]/, ' ').gsub(/ +/, ' ')
end
