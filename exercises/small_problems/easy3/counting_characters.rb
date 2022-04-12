print "Please write word or multiple words: "
user_string = gets.chomp
string_char_count = user_string.gsub(' ','').size #should use delete instead of gsub
puts "There are #{string_char_count} characters in \"#{user_string}\"."