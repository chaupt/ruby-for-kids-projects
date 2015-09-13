require 'gosu'

class Tile
  attr_reader :row, :column, :number, :type

  PLAYER_TYPE   = 'P'
  START_TYPE    = 'S'
  EXIT_TYPE     = 'E'
  TREASURE_TYPE = 'T'
  EMPTY_TYPE    = '.'

  WIDTH = 32
  HEIGHT = 32

  def initialize(window, column, row, type)
    @@colors ||= {red: Gosu::Color.argb(0xaaff0000),
      green: Gosu::Color.argb(0xaa00ff00),
      gold: Gosu::Color.argb(0xaaffff00),
      blue: Gosu::Color.argb(0xaa0000ff)}
    @@font ||= Gosu::Font.new(24)
    @@window ||= window
    @row    = row
    @column = column
    @type   = type
    @hidden = false
  end

  def hidden?
    @hidden
  end

  def hide!
    @hidden = true
  end

  def is_treasure?
    @type == TREASURE_TYPE
  end

  def is_start?
    @type == START_TYPE
  end

  def is_exit?
    @type == EXIT_TYPE
  end

  def is_player?
    @type == PLAYER_TYPE
  end

  def is_empty?
    @type == EMPTY_TYPE || @type == ' '
  end

  def tile_is_drawn?
    !is_empty? && !is_start?
  end

  def tile_can_be_entered?
    is_empty? || is_start? || is_treasure? || is_exit?
  end

  def make_empty
    @type = EMPTY_TYPE
  end

  def move_to(column, row)
    @column = column
    @row    = row
  end

  def move_by(column_delta, row_delta)
    move_to(@column + column_delta, @row + row_delta)
  end

  def color
    if is_player?
      @@colors[:red]
    elsif is_exit?
      @@colors[:green]
    elsif is_treasure?
      @@colors[:gold]
    else
      @@colors[:blue]
    end
  end

  def draw
    if tile_is_drawn? && !hidden?
      x1 = @column * WIDTH
      y1 = @row * HEIGHT
      x2 = x1 + WIDTH
      y2 = y1
      x3 = x2
      y3 = y2 + HEIGHT
      x4 = x1
      y4 = y3
      c = color
      @@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 2)
      x_center = x1 + (WIDTH / 2)
      x_text = x_center - @@font.text_width("#{@type}") / 2
      y_text = y1 + 4
      @@font.draw("#{@type}", x_text, y_text, 1)
    end
  end

end
