def running_total(number_list)
  previous_number = 0 

  number_list.map do |num|
    running_total = num + previous_number
    previous_number = running_total

    running_total
  end
end


# written with Enumberable#each_with_object
def running_total(number_list)
  sum = 0 
  number_list.each_with_object([]) do |num, total_list|
    sum += num
    total_list << sum 
  end
end

# written with Enumberable#inject
def running_total(number_list)
  return_list = []

  number_list.inject(0) do |memo, num|
    return_list << (memo + num)
    memo + num
  end
end
