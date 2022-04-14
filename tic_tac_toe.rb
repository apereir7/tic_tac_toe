# frozen_string_literal: false

require 'pry-byebug'

# Display grid
module Display
end

# player
class Player
  attr_accessor :pick

  include Display

  @@matrix = [
    [' ', ' ', ' '],
    [' ', ' ', ' '],
    [' ', ' ', ' ']
  ]

  def grid
    puts '     r1   r2    r3'
    puts "c1  #{@@matrix[0]}"
    puts "c2  #{@@matrix[1]}"
    puts "c3  #{@@matrix[2]}"
  end

  def initialize(pick)
    @pick = pick
  end

  def self.var
    p @@matrix
  end

  def self.grid
    puts '     r1   r2    r3'
    puts "c1  #{@@matrix[0]}"
    puts "c2  #{@@matrix[1]}"
    puts "c3  #{@@matrix[2]}"
  end
end

first_player = Player.new('X')

second_player = Player.new('O')

puts first_player.pick

first_player.grid
