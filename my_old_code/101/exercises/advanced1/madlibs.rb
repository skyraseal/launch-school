SINGLE_NOUN = %w(ball flower guitar elephant phone keyboard cheeto iguana banana).freeze
PLURAL_NOUN = %w(balls flowers guitars elephants phones keyboards cheetos iguanas bananas).freeze
PRONOUN = %w(Wilson Timmy Tilly Arya Susanna Keepo Django).freeze
PRESENT_VERB = %w(sing flop eat read crawl bounce shimmy).freeze
PAST_VERB = %w(sang flopped ate read crawled bounced shimmied).freeze
ADJECTIVE = %w(blue flapping gooey cuddly slow wild tame).freeze
ADVERB = %w(quickly deftly slowly courteously wildly).freeze
TITLE = %w(Mr Ms Mrs Senor Senorita King Queen Policeman Gov'nah President)

madlib_library_reference = {
  "adjective" => ADJECTIVE,
  "adverb" => ADVERB,
  "single-noun" => SINGLE_NOUN,
  "plural-noun" => PLURAL_NOUN,
  "present-verb" => PRESENT_VERB,
  "past-verb" => PAST_VERB,
  "title" => TITLE,
  "pronoun" => PRONOUN
}

madlibs, story = File.open("madlibtext.txt", "r").read.to_s.split("\n<<TEXT>>")
madlib_list = madlibs.split("\n").uniq.map {|e| e.chomp}
madlib_values = Hash.new

madlib_list.each do |madlib_word|
  #puts (madlib_word.split("<")[1].split"[")[0]
  #puts "Please input a new #{(madlib_word.split("<")[1].split"[")[0]}:"
  #word_input = gets.chomp
  word_type = (madlib_word.split("<")[1].split"[")[0]
  madlib_values[madlib_word] = madlib_library_reference[word_type].sample
end

madlib_values.each do |key, value|
  story.gsub!(key, value)
end

puts story
