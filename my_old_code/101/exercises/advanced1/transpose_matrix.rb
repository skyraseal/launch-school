# Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the transpose of the original matrix. 
# Ruby has a built in method for arrays that does this, Array#transpose.  But you may not use it for this exercise.

def transpose(matrix)
  # Structure:  # of nested arrays equals the # of rows.  Length of each nested array equals the # of columns.
  # Transposing it will flip the rows and columns
  # In this method I will just assume the length of the nested arrays are all the same.

  orig_rows = matrix.length
  orig_cols = matrix[0].length

  # Make a container array
  new_matrix = []

  # Nest loop!
  new_row_counter_max = orig_cols - 1
  new_col_counter_max = orig_rows - 1
  new_row_counter = 0
  until new_row_counter > new_row_counter_max  do
    new_col_counter = 0
    new_nested_array = []

    until new_col_counter > new_col_counter_max do 
      new_nested_array << matrix[new_col_counter][new_row_counter]
      new_col_counter += 1
    end

    new_matrix << new_nested_array
    new_row_counter += 1
  end
    
    new_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]