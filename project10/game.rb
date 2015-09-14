require 'gosu'
require_relative 'level'
require_relative 'player'

class Game

  LEVEL1 = [
    "+------------------+",
    "|S.|....T..........|",
    "|..|.--------..|++.|",
    "|..|.|....|T|..|T..|",
    "|.+|.|.E|.|....|...|",
    "|..|.|---.|.|--|...|",
    "|..|.|....|.|......|",
    "|+.|.|......|..|-|.|",
    "|..|.|-----.|..|+|.|",
    "|..|T.......|..|+|.|",
    "|.++--------+..|+|.|",
    "|.+....+++.....|+|.|",
    "|...++.....+++.|+|.|",
    "|---------------+..|",
    "|T+|......|.....|.||",
    "|..|..|......+T.|.||",
    "|+...+|---------+..|",
    "|..|.............+.|",
    "|T+|..++++++++++...|",
    "+------------------+"
  ]

  def initialize(window)
    @window     = window
    @player     = Player.new(@window, 0, 0)
    @level      = Level.new(@window, @player, LEVEL1)
    @font       = Gosu::Font.new(32)
    @time_start = Time.now.to_i
  end

  def button_down(id)
    @level.button_down(id)
  end

  def update
    @level.update
    if !@level.level_over?
      @time_now = Time.now.to_i
    end
  end

  def draw
    @level.draw
    draw_hud
  end

  def draw_hud
    if @level.level_over?
      @font.draw("GAME OVER!", 170, 150, 10, 2, 2)
      @font.draw("Collected #{@player.score} treasure in #{time_in_seconds} seconds!",
      110, 300, 10)
    else
      @font.draw("Time: #{time_in_seconds}", 4, 2, 10)
      @font.draw("Score: #{@player.score}", 510, 2, 10)
    end
  end

  def time_in_seconds
    @time_now - @time_start
  end
end
