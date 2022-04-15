# frozen_string_literal: false

require 'pry-byebug'

# Display grid
module Display
  def add_cell(array, choice)
    array.detect { |num| num == choice }
  end

  def tictactoe(array)
    if array[0] == array[1] && array[1] == array[2]
      true
    elsif array[3] == array[4] && array[4] == array[5]
      true
    elsif array[6] == array[7] && array[7] == array[8]
      true
    elsif array[0] == array[3] && array[3] == array[6]
      true
    elsif array[1] == array[4] && array[4] == array[7]
      true
    elsif array[2] == array[5] && array[5] == array[8]
      true
    elsif array[0] == array[4] && array[4] == array[8]
      true
    elsif array[2] == array[4] && array[4] == array[6]
      true
    else
      false
    end
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
