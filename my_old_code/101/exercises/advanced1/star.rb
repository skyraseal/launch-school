def empty_list(n)
  empty_array = Array.new
  n.times {empty_array << " "}
  empty_array
end

def star(n)
  line = []
  middle = n/2
  st_mod = 0
  en_mod = -1
  counter = 0
  until counter == n do
    line = empty_list(n)
    if counter == middle
      line.map! {|star| star = "*"}
    else
      line[st_mod] = "*"
      line[en_mod] = "*"
      line[middle] = "*"
    end
    st_mod += 1
    en_mod -= 1
    counter += 1
    print line.join
    print "\n"
  end


end

star(7)
star(9)