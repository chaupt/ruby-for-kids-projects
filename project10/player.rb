require 'gosu'
require_relative 'tile'

class Player < Tile
  attr_reader :score

  def initialize(window, column, row)
    super(window, column, row, Tile::PLAYER_TYPE)
    @score = 0
  end

  def pick_up(tile)
    if tile.is_treasure?
      @score += 1
      tile.make_empty
    end
  end
end
