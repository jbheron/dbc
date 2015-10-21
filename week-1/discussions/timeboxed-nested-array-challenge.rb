

# sample board:
#   abc
#   def
#   ghi

def make_board
  [["a", "b", "c"], ["d", "e", "f"], ["g", "h", "i"]]
end

board = make_board
p board 

def get_element(board, row_number, col_number)
  board[row_number-1][col_number-1]
end

puts get_element(board, 3, 2) == "h"


# **1**
# RETURN A ROW
# input: board, row number
# output: row array

def get_row(board, row_number)
  board[row_number-1]
end

puts get_row(board, 1) == ["a", "b","c"]



# *2*
# RETURN A COLUMN
# input:  column number
# output: array with elements from the column

def get_column_from_board_with_col_number(board, col_number)
  board.transpose[column_number-1]
  # column = []
  board.map { |row| row[col_number - 1] }
  # column
end

p get_column_from_board_with_col_number(board, 2) # == ["b", "e", "h"]


# *3*
# MAKE A MORE EXTENSIBLE MAKE_BOARD method
# input: 9 characters a-i as a string "abcdefghi"
# output: 2 dimensional array of the chars (3x3)
def make_board(char_string)
end

# puts make_board((a..i).to_a)


# *4* 
# EVEN MORE EXTENSIBLE MAKE_BOARD METHOD
# input: string of a number of characters
# output: a 2 dimensional array of elements representing a square board



# *5*
# RETURN DIAGONAL
# input: 
# output:

# puts get_diag(board, [])


