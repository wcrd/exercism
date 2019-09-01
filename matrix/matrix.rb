class Matrix
  # Stores matrix from String input. Integers only.
  
  def initialize(matrix_string)
    @matrix = matrix_from_string(matrix_string)
  end

  def rows
    @matrix
  end

  def columns
    @matrix.transpose
  end


  private

  def matrix_from_string(string)
    # create rows
    matrix = string.split("\n")
    # create columns, convert entries to integers
    matrix.map { |row| row.split.map(&:to_i) }
  end
end