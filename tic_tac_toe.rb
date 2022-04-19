# frozen_string_literal: false

require 'pry-byebug'

# Display
module Display
  # check individual row
  def row_check?(row)
    row.all?('X') || row.all?('O')
  end

  # check horizantal row

  def three_in_row?(array1, array2, array3)
    row_check?(array1) || row_check?(array2) || row_check?(array3)
  end

  # check vertical columm
  def three_in_column?(array)
    row_check?([array[0], array[3], array[6]]) ||
      row_check?([array[1], array[4], array[7]]) ||
      row_check?([array[3], array[5], array[8]])
  end
  # check diagonals

  def diagonally?(array)
    diagnal1 = [array[0], array[4], array[8]]
    diagnal2 = [array[2], array[4], array[6]]

    row_check?(diagnal1) || row_check?(diagnal2)
  end

  def game?(array)
    # check the rows
    three_in_row?(array[0..2], array[3..5], array[6..8]) ||
      # check the columns
      three_in_column?(array) ||
      # check diagnal
      diagonally?(array)
  end

  def grid(array)
    puts "\n"
    puts array[0..2].to_s
    puts array[3..5].to_s
    puts array[6..8].to_s
  end

  def change_cell(num, array1, array2)
    array1[num - 1] = pick
    array2[num - 1] = pick
  end
end

# player
class Player
  attr_accessor :pick

  include Display

  @@matrix = [
    1, 2, 3,
    4, 5, 6,
    7, 8, 9
  ]

  @@empty = [
    ' ', ' ', ' ',
    ' ', ' ', ' ',
    ' ', ' ', ' '
  ]

  def initialize(pick)
    @pick = pick
  end

  def matrix_grid
    @@matrix
  end

  def empty_grid
    @@empty
  end
end

first_player = Player.new('X')

second_player = Player.new('O')

puts "\nFirst player is team #{first_player.pick}"
puts "\nSecond player is team #{second_player.pick}"
puts "\nEach grid cell is labeled as so for you to choose"

puts first_player.grid(first_player.matrix_grid)

puts "\nPick an empty cell to begin \n"

puts first_player.grid(first_player.empty_grid)

first_player.change_cell(1, first_player.matrix_grid, first_player.empty_grid)

puts second_player.grid(second_player.empty_grid)
