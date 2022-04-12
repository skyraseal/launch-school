def oddities(array)
  result_array = []
  array.each_with_index do |object, index|
    result_array << object if index % 2 == 0
  end

  result_array
end

