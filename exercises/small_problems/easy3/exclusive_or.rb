def xor?(first, second)
  !(first && second) && (first || second)
end