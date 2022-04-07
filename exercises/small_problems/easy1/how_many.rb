# given an array, count the number of occurences per element
# make the count case-sensitive
# output it as a hash?

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck', 'suv',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurences(vehicles)
  occurence_count = {}
  vehicles.each do |v_type|
    if occurence_count[v_type] == nil 
      occurence_count[v_type] = 1
    else
      occurence_count[v_type] += 1
    end
  end

  occurence_count.each {|k, v| puts "#{k} => #{v}"}
end
