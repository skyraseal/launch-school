def print_in_box(string)
  # have to determine horizontal and vertical length
  # horizontal is the longest line + 2 characters
  # vertical length is newline characters + 1, and +4 more for above and below

  individual_lines = string.split("\n")
  line_lengths = individual_lines.map { |line| line.length }
  max_line_length = line_lengths.max

  horizontal = max_line_length + 2 
  vertical = individual_lines.count

  puts horizontal_lines(('-' * horizontal), '+-')
  puts horizontal_lines((' ' * horizontal), '| ')
  puts box_lines(individual_lines, horizontal)
  puts horizontal_lines((' ' * horizontal), '| ')
  puts horizontal_lines(('-' * horizontal), '+-')
end

def box_lines(lines, horizontal_length)
  lines.map { |line| '| '+line.center(horizontal_length)+' |' }.join("\n")
end

def horizontal_lines(content, edge)
  edge + content + edge.reverse
end