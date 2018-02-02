# Should return the # of living neighbors of cell in location x, y
# in array arr

def num_neighbors(x, y, arr)
  # count = 0
  # if arr[x-1][y-1] == "x"
  #   count = count + 1
  # end
  # if arr[x][y-1] == "x"
  #   count = count + 1
  # end
  # if arr[x+1][y-1] == "x"
  #   count = count + 1
  # end
  # if arr[x-1][y] == "x"
  #   count = count + 1
  # end
  # if arr[x+1][y] == "x"
  #   count = count + 1
  # end
  # if arr[x-1][y+1] == "x"
  #   count = count + 1
  # end
  # if arr[x][y+1] == "x"
  #   count = count + 1
  # end
  # if arr[x+1][y+1] == "x"
  #   count = count + 1
  # end
  # count
  count = 0
  size = arr.size
  left_x = (x - 1) % size
  right_x = (x + 1) % size
  up_y = (y - 1) % size
  down_y = (y + 1) % size
  count += 1 if arr[left_x][up_y] == "x"
  count += 1 if arr[x][up_y] == "x"
  count += 1 if arr[right_x][up_y] == "x"
  count += 1 if arr[left_x][y] == "x"
  count += 1 if arr[right_x][y] == "x"
  count += 1 if arr[left_x][down_y] == "x"
  count += 1 if arr[x][down_y] == "x"
  count += 1 if arr[right_x][down_y] == "x"
  count
end

# Should perform one iteration of Conway's game of life

def iterate(arr)
  new_arr = []
  (0..(arr.size - 1)).each do |x|
    new_arr[x] = []
    (0..(arr.size - 1)).each do |y|
      if num_neighbors(x, y, arr) == 3
        new_arr[x][y] = "x"
      elsif arr[x][y] == "x" && num_neighbors(x, y, arr) != 2
        new_arr[x][y] = "."
      else
        new_arr[x][y] = "."
      end
    end
  end
  new_arr
end

# Given a pseudorandom number generator, a size, and a percentage
# of cells to be alive, make a size x size array (e.g., a 10 x 10 array
# if size = 10), and randomly assign percent % of them to be living.
# Return the newly created array to the caller.

def create_arr(prng, size, percent)
  arr = []
  (0...size).each do |x|
    arr[x] = []
    (0...size).each do |y|
      arr[x][y] = prng.rand(101) <= percent
      if arr[x][y] == true
        arr[x][y] = "x"
      else
        arr[x][y] = "."
      end
    end
  end
  arr
end

# Print the array to the screen, with x representing a living
# cell and . representing a dead cell.
# Finish the printing with a single line of asterisks, exactly
# as long as the array is wide.
# There is no need to return anything
# Example:
# ...........
# ...........
# ...........
# ...........
# ...........
# ...........
# .........x.
# ........x.x
# .......x..x
# ........xx.
# ...........
# ***********

def print_arr(arr)
  j = 0
  until j == arr.size
    k = 0
    until k == arr.size
      print arr[j][k]
      k = k + 1
    end
    puts
    j = j + 1
  end
  (0..arr.size).each do
    print '*'
  end
  puts
end

# EXECUTION STARTS HERE

raise "Enter integers for size, percentage (1..100), and number of iterations at command line" unless ARGV.count == 3
size, percent, iters = ARGV[0].to_i, ARGV[1].to_i, ARGV[2].to_i

# If size is not >0, inform the user and exit
unless size > 0
  raise "size is not greater than 0"
end

# If percent is not an integer between 0 and 100, inform the user and exit
unless percent > -1 && percent < 101
  raise "percent must be between 0 and 100"
end

# If number of iterations is not an integer that is 0 or greater, inform the user and exit
unless iters > -1
  raise "number of iterations must be 0 or greater"
end

prng = Random::new

# Create the array
arr = create_arr prng, size, percent

# Iterate for _iters_ iter  ations
(0..iters).each do |x|
  print_arr arr
  arr = iterate arr
end
