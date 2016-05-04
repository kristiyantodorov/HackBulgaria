def number_to_digits(n)
  n.to_s.chars.map { |ch| ch.to_i }
end

def digits_to_number(n)
  result = ""
  n.each { |num| result += num.to_s }
  result.to_i
end

def min(items)
  min = items[0]
  iter = 1
  while iter < items.size
    if items[iter] < min
      min = items[iter]
    end
    iter += 1
  end
  min
end

def max(items)
  max = items[0]
  iter = 1
  while iter < items.size
    if items[iter] > max
      max = items[iter]
    end
    iter += 1
  end
  max
end

def nth_min(n, items)
  if n == 1
    min(items)
  else
    nth_min n - 1, items.reject { |e| e == min(items) }
  end
end

def nth_max(n, items)
  if n == 1
    max(items)
  else
    nth_max n - 1, items.reject { |e| e == max(items) }
  end
end

def grayscale_histogram(image)
  result = Array.new 5, 0
  row_index, col_index = 0, 0

  while row_index < image.length
    while col_index < image[row_index].length
      pixel_value = image[row_index][col_index]
      histogram[pixel_value] += 1
      col_index += 1
    end
    row_index += 1
  end
end

def maxScalarProduct(v1, v2)
  result = [v1.sort, v2.sort]
end

def max_span(numbers)
  first_index = 0
  last_index = numbers.size - 1
  max_s = 1
  until first_index == numbers.size - 1
    last_index = numbers.size - 1
    while last_index >= first_index
      if numbers[first_index] == numbers[last_index]
        curr_span = last_index - first_index + 1
      else
        curr_span = 1
      end
      max_s = curr_span if curr_span > max_s
      last_index -= 1
    end
    first_index += 1
  end
  max_s
end

def sum_matrix(m)
  m.flatten.reduce(:+)
end

m = [[1, 2, 3],
     [4, 5, 6],
     [7, 8, 9]]

def matrix_bombing_plan(m)
  plan = {}
  directions = [[1, 1], [1, 0], [1, -1],
                [-1, -1], [-1, 0], [-1, -1].
                [0, 1], [0, -1]]

  iter_row, iter_col = 0, 0
  while iter_row < m.size
    while iter_col < m[iter_row].size
      coord = [iter_row, iter_col]

      count = case
                when(coord[0] == 0 and coord[1] == 0)
                  3
                when(coord[0] != 0 and coord[1] != 0)
                  8
                else
                  5
              end
      damage = count * m[iter_row][iter_col]
      plan[[iter_row, iter_col]] = damage
      iter_col += 1
    end
    iter_row += 1
  end
  plan
end