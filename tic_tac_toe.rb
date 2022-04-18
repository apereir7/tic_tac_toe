# frozen_string_literal: false

require 'pry-byebug'

# Display grid
module Display
  def add_cell(array, choice)
    array.detect { |num| num == choice }
  end

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

  

  def initialize(pick)
    @pick = pick
  end

  def self.var
    puts @@matrix
  end

  def self.grid
    puts "\n"
    puts @@matrix[0..2].to_s
    puts @@matrix[3..5].to_s
    puts @@matrix[6..8].to_s
  end
end

first_player = Player.new('X')

second_player = Player.new('O')

puts "\nFirst player is team #{first_player.pick}"

puts "\nSecond player is team #{second_player.pick}"

Player.grid
