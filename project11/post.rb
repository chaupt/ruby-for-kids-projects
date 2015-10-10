require 'gosu'

class Post

  def initialize(window, x, y, width=40, height=400)
    @height = height
    @width  = width
    @x      = x
    @y      = y
    @color  = Gosu::Color.argb(0xaa0000ff)
    @window = window
    @discs  = []
  end

  def add_disc(disc)
    @discs.push(disc)
    disc.post = self
  end

  def remove_disc(disc)
    @discs.delete(disc)
    disc.post = nil
  end

  def last
    @discs.last
  end

  def find_disc_position(disc)
    @discs.find_index(disc)
  end

  def sort_discs
    @discs.sort_by! { |disc| -disc.number }
  end

  # can this disc move here?
  def valid_move?(disc)
      # first, is there a disc ontop of this one on its current post?
      disc.top_most? &&
        (@discs.empty? ||
          disc.number < last.number)
  end

  # move disc here
  def move_disc(disc)
    disc.post.remove_disc(disc)
    add_disc(disc)
  end

  def contains?(mouse_x, mouse_y)
    mouse_x >= @x && mouse_x <= @x + @width &&
      mouse_y >= @y && mouse_y <= @y + @height
  end

  def center
    @x + (@width / 2)
  end

  def base
    @y + @height
  end

  def draw
    @window.draw_quad(
      @x, @y, @color,
      @x + @width, @y, @color,
      @x + @width, @y + @height, @color,
      @x, @y + @height, @color)
  end
end
