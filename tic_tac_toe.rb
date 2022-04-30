# frozen_string_literal: false

# Display
module Display
  # check individual row
  def row_check?(row)
    row.all?('X') || row.all?('O')
  end

  # check horizantal row
  def horrizantal?(array)
    row_check?(array[0..2]) || row_check?(array[3..5]) || row_check?(array[6..8])
  end

  # check vertical columm
  def column?(array)
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

  # tic tac toe, three in a row
  def tictactoe?(array)
    # check the rows
    horrizantal?(array) ||
      # check the columns
      column?(array) ||
      # check diagnal
      diagonally?(array)
  end

  # aesthetically pleasing display
  def display_grid(array)
    puts "\n"
    puts array[0..2].to_s
    puts array[3..5].to_s
    puts array[6..8].to_s
  end

  def change_cell(num, array1, array2)
    array1[num - 1] = pick
    array2[num - 1] = pick
  end

  def take_turn(player1, player2)
    if tictactoe?(player1.matrix_grid)
      puts "#{player1.pick} wins"
    elsif  tictactoe?(player2.matrix_grid)
      puts "#{player2.pick} wins"
    else
      not_three_in_row()
    end
  end

  def not_three_in_row()
    puts "\nPick an empty cell player X\n"
    num1 = gets.chomp
    player1.change_cell(num1, player1.matrix_grid, player1.empty_grid)
    puts "\nPick an empty cell player 0\n"
    num2 = gets.chomp
    player2.change_cell(num1, player2.matrix_grid, player2.empty_grid)
  end

  def show_empty_grid
    puts '[" ", " ", " "]'
    puts '[" ", " ", " "]'
    puts '[" ", " ", " "]'
  end

  def pick_a_cell
    puts "\nchoose a cell from 1-9 and then press enter"
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

  def self.class_grid
    @@matrix
  end

  def self.instruction(player)
    puts "The two teams are 'X' and 'O'"
    puts "\nEach grid cell is labeled as so for you to choose\n"
    # shows how each cell is labeled
    puts player.display_grid(player.matrix_grid)
    puts "\nPick an empty cell to begin \n"
    player.show_empty_grid
  end
end

first_player = Player.new('X')
second_player = Player.new('0')

Player.instruction(first_player)

binding.break

first_player.change_cell(gets.chomp.to_i, first_player.matrix_grid, first_player.empty_grid)

#first_player.change_cell(1, first_player.matrix_grid, first_player.empty_grid)

#second_player.display_grid(second_player.empty_grid)


