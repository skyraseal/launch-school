#write a method named xor that takes two arguments, and returns true if exactly one of its arguments is truthy, false otherwise.

def xor(arg1, arg2)
  if (!!arg1 && !arg2) || (!arg1 && !!arg2)
    true
  else
    false
  end
end
