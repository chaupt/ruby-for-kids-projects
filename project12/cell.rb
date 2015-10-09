require 'gosu'

class Cell
  WIDTH = 10
  HEIGHT = 10

  def initialize(window, alive, column, row)
    @@colors ||= {red: Gosu::Color.argb(0xaaff0000),
      green: Gosu::Color.argb(0xaa00ff00),
      blue: Gosu::Color.argb(0xaa0000ff)}
    @@window ||= window
    @alive  = alive
    @column = column
    @row    = row
  end

  def life_points
      alive? ? 1 : 0
  end

  def alive?
    @alive
  end

  def die!
    @alive = false
  end

  def live!
    @alive = true
  end

  def color
    @@colors[:green]
  end

  def draw
    if alive?
      x1 = @column * WIDTH
      y1 = @row * HEIGHT
      x2 = x1 + WIDTH
      y2 = y1
      x3 = x2
      y3 = y2 + HEIGHT
      x4 = x1
      y4 = y3
      c = color
      @@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 20)
    end
  end

end
