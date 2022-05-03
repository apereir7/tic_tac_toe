# frozen_string_literal: false

# Display
module Display
  # check individual row
  def row_check?(row)
    if row.all?('X')
      puts 'Team X wins'
      true
    elsif row.all?('O')
      puts 'Team O wins'
      true
    else
      false
    end
  end

  # check horizantal row
  def horrizantal?(array)
    row_check?(array[0..2]) || row_check?(array[3..5]) || row_check?(array[6..8])
  end

  # check vertical columm
  def column?(array)
    row_check?([array[0], array[3], array[6]]) ||
      row_check?([array[1], array[4], array[7]]) ||
      row_check?([array[2], array[5], array[8]])
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

  # aesthetically pleasing way to display given array
  def display_grid(array)
    puts "\n"
    puts array[0..2].to_s
    puts array[3..5].to_s
    puts array[6..8].to_s
  end

  def change_cell(num, array1, array2)
    array1[num.to_i - 1] = pick
    array2[num.to_i - 1] = pick
  end

  def player_round(player1, player2)
    if tictactoe?(player1.matrix_grid) && tictactoe?(player1.empty_grid)
      puts 'Game Over'
    elsif tictactoe?(player2.matrix_grid) && tictactoe?(player2.empty_grid)
      puts 'Game Over'
    else
      not_three_in_row(player1, player2)
    end
  end

  # If no winner, then player_round() goes to this method
  def not_three_in_row(player1, player2)
    puts "\nPick a cell player #{player1.pick}\n"
    player1.change_cell(gets.chomp, player1.matrix_grid, player1.empty_grid)
    puts "\n"
    player1.display_grid(player1.empty_grid)
    check_score(player1, player2)
  end

  # Checks the score after player picks their cell, if winner/full grid, then game over, if not, then back to check_winner method
  def check_score(player1, player2)
    if player1.tictactoe?(player1.matrix_grid)
      puts 'Game over'
    elsif player1.full_grid?(player1.matrix_grid)
      puts 'Grid is full. Game over'
    else
      player_round(player2, player1)
    end
  end

  # Grid was initally all Numeric. If full, all cells will be strings
  def full_grid?(array)
    array.all?(String)
  end
end

# player
class Player
  attr_accessor :pick

  include Display

  # Need class variable to share information
  @@matrix = [
    1, 2, 3,
    4, 5, 6,
    7, 8, 9
  ]

  # Need class variable to share information
  @@empty = [
    ' ', ' ', ' ',
    ' ', ' ', ' ',
    ' ', ' ', ' '
  ]

  def initialize(pick)
    @pick = pick
  end

  # Numbered array
  def matrix_grid
    @@matrix
  end

  # Empty array
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
    player.display_grid(player.empty_grid)
  end
end

first_player = Player.new('X')
second_player = Player.new('O')

Player.instruction(first_player)

first_player.player_round(first_player, second_player)

