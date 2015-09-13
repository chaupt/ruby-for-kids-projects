require 'gosu'
require_relative 'tile'

class TileTest < Gosu::Window
  def initialize
    super(640, 640)
    self.caption = "Testing Tiles"
    @tile1 = Tile.new(self, 0, 2, :blue)
    @tile2 = Tile.new(self, 1, 1, :red)
  end

  def draw
    @tile1.draw
    @tile2.draw
  end

end
window = TileTest.new
window.show
