require 'gosu'
require_relative 'cell'

class Grid
  include Enumerable

  def initialize(window, columns, rows, seeds=nil)
    @window     = window
    @total_rows = rows
    @total_columns = columns
    @board = setup_grid
    plant_seeds(@board, seeds)
  end

  def setup_grid
    grid = []
    @total_rows.times do |row|
      cells = []
      @total_columns.times do |col|
        cells << Cell.new(@window, false, col, row)
      end
      grid << cells
    end
    grid
  end

  # Seeds are an array of x,y arrays or nil for random
  def plant_seeds(board, seeds)
    if seeds.nil? || seeds.empty?
      40.times do
        board[rand(@total_rows)][rand(@total_columns)].live!
      end
    else
      # puts seeds.inspect
      seeds.each do |x,y|
        cell(x,y).live!
      end
    end
  end

  def cell(x, y)
    if @board[y]
      @board[y][x]
    else
      nil
    end
  end

  def each
    @total_rows.times do |row|
      @total_columns.times do |col|
        yield cell(col, row)
      end
    end
  end

  def each_cell_position
    @total_rows.times do |row|
      @total_columns.times do |col|
        yield col, row
      end
    end
  end

  def surrounding_cells(x, y)
    cells = []
    (y - 1).upto(y + 1) do |row|
      (x - 1).upto(x + 1) do |column|
        next if row < 0 || row >= @total_rows
        next if column < 0 || column >= @total_columns
        next if x == column && y == row
        cells << cell(column,row)
      end
    end
    cells.compact
  end

  def lifeless?
    none? do |cell|
      cell.alive?
    end
  end

  def life
    living_cells = []
    each_cell_position do |x,y|
      living_cells << [x,y] if cell(x,y).alive?
    end
    living_cells
  end

  def ==(other)
    self.life == other.life
  end

  def draw
    each do |c|
      if c
        c.draw
      end
    end
  end

end
