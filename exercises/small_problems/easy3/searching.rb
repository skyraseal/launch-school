def prompt(message)
  puts ">> #{message}"
end

def add_input(result_array)
  input = gets.chomp.to_i
  result_array << input 
end

def search_array(looking_for, collection)
  if collection.include?(looking_for.to_i)
    prompt("The number #{looking_for} appears in #{collection}.")
  else 
    prompt("The number #{looking_for} does not appear in #{collection}.")
  end
end

number_collection = []

prompt("Enter the 1st number:")
add_input(number_collection)

prompt("Enter the 2nd number:")
add_input(number_collection)

prompt("Enter the 3rd number:")
add_input(number_collection)

prompt("Enter the 4th number:")
add_input(number_collection)

prompt("Enter the 5th number:")
add_input(number_collection)

prompt("Enter the last number:")
search_number = gets.chomp.to_i

search_array(search_number, number_collection)
