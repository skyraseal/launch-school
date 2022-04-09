def stringy(n)
  tens = n/2
  remainders = n%2
  output = ''

  output = '10'*tens + '1'*remainders
end

# further modifications
# Modify stringy so it takes an additional optional argument that defaults to 1. 
# If the method is called with this argument set to 0, 
# the method should return a String of alternating 0s and 1s, 
# but starting with 0 instead of 1.

def stringy_modified(n, start=1)
  tens = n/2
  remainders = n%2
  output = ''

  if start == 0
    output = '01'*tens + '0'*remainders
  else 
    output = '10'*tens + '1'*remainders
  end
end