require 'gosu'

class Disc

  DISC_HEIGHT       = 30
  BASE_DISC_SIZE    = 40
  DISC_VERTICAL_GAP = 10

  attr_reader :width, :height, :color, :selected_color, :number, :selected, :x, :y
  attr_accessor :post

  def initialize(window, number, starting_post)
    @window = window
    @number = number # larger is bigger
    @height = DISC_HEIGHT
    @width  = BASE_DISC_SIZE * (@number + 1)
    @color  = Gosu::Color.argb(0xaaff00ff)
    @selected_color  = Gosu::Color.argb(0xaaffeeff)
    @selected= false
    @x      = 0
    @y      = 0
    @post   = nil
    starting_post.add_disc(self)
  end

  def toggle_selected
    @selected = !@selected
  end

  def top_most?
      post.last == self
  end

  def contains?(mouse_x, mouse_y)
    mouse_x >= x && mouse_x <= x + width &&
      mouse_y >= y && mouse_y <= y + height
  end

  # Asked post for correct drawing info
  def draw
    if post
      @x = post.center - width / 2
      position = post.find_disc_position(self)
      if position
        if selected
          c = selected_color
        else
          c = color
        end
        # calculate the y position based on height of post
        @y = post.base - height - (position * (height + DISC_VERTICAL_GAP))
        @window.draw_quad(
          @x, @y, c,
          @x + width, @y, c,
          @x + width, @y + height, c,
          @x, @y + height, c)
      end
    end
  end
end
