# Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument.
# (The first Fibonacci number has index 1.)

def dgt_amt(number_string)
  number_string.to_s.length
end

def find_fibonacci_index_by_length(fib_num_length)
  index = 1
  last_fib_num = 0
  current_fib_num = 1
  nxt_fib_num = nil

  until dgt_amt(current_fib_num) == fib_num_length
    nxt_fib_num = current_fib_num + last_fib_num
    last_fib_num = current_fib_num
    current_fib_num = nxt_fib_num
    index += 1
  end

  index
end

find_fibonacci_index_by_length(2) == 7
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847
