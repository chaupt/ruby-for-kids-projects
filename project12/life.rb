#
# Ruby for Kids Project 12: Life
# Programmed By: Chris Haupt
# A graphical version of Conway's Game of Life
#
# To run the program, use:
# ruby life.rb
#
require 'gosu'
require_relative 'game'

class Life < Gosu::Window

  def initialize(generations, sim)
    super(800, 800)
    self.caption = "Game of Life"
    @game = Game.new(self, generations, sim)
  end

  def update
    @game.update
  end

  def draw
    @game.draw
  end

end

puts "Welcome to the Game of Life"
print "How many generations? (0 for infinite) "
generations = gets.to_i
print "Pick a simulation (1-5) "
sim = gets.to_i

window = Life.new(generations, sim)
window.show
