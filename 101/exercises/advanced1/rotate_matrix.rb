# Rotate matrix
def rotate90(matrix)

  old_row_length = matrix.length
  old_col_length = matrix[0].length

  rotated_matrix = []

  (0...old_col_length).each do |row|
    new_row = []
    (0...old_row_length).each do |col|

      #LOGIC
      new_row << matrix[col][(row-old_row_length-1).abs]

    end
    rotated_matrix << new_row
  end

  rotated_matrix
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
p new_matrix1 #== [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 #== [[5, 3], [1, 7], [0, 4], [8, 2]]