require 'gosu'
require_relative 'grid'
require_relative 'cell'

class Game

  GENERATION_FREQUENCY = 100 # in milliseconds
  # Starter Lifeforms to try

  SEED_BLINKER = [[11,10],[11,11],[11,12]]
  SEED_GLIDER  = [[1,0],[2,1],[0,2],[1,2],[2,2]]
  SEED_THUNDER = [[30,19],[30,20],[30,21],[29,17],[30,17],[31,17]]
  SEED_GROWER  = [[12,12],[13,12],[14,12],[16,12],[12,13],[15,14],[16,14],[13,15],[14,15],[16,15],[12,16],[14,16],[16,16]]
  SEED_RANDOM  = []

  SEED_LIST    = [SEED_BLINKER, SEED_GLIDER, SEED_THUNDER, SEED_GROWER]

  GRID_WIDTH  = 80
  GRID_HEIGHT = 80

  def initialize(window, generations, sim)
    @window     = window
    seed        = SEED_LIST[sim - 1]
    @grid       = Grid.new(@window, GRID_WIDTH, GRID_HEIGHT, seed)
    @font       = Gosu::Font.new(32)
    @time_now = @time_start = Time.now.to_i
    @last_update = 0
    @generation  = 0
    @max_generations = generations.to_i
    @status_message = "Completed"
  end

  def simulation_over?
    (@max_generations > 0) && (@generation >= @max_generations)
  end

  def update
    # once a second, update the simulation if you haven't reached
    # the maximum number requested
    this_time = Gosu::milliseconds()
    if (this_time - @last_update > GENERATION_FREQUENCY &&
      (@max_generations == 0 ||
      @generation < @max_generations))
      new_grid = evolve
      @generation += 1

      # Check for some cases where things freeze up
      if new_grid.lifeless?
        @status_message = "Life disappeared"
        @max_generations = @generation
      elsif new_grid == @grid
        @status_message = "Life froze"
        @max_generations = @generation
      end

      @grid = new_grid
      @last_update = this_time
      @time_now = Time.now.to_i

    end
  end

  def evolve
    life = []
    @grid.each_cell_position do |x,y|
      if determine_fate(x, y)
        life << [x, y]
      end
    end
    Grid.new(@window, GRID_WIDTH, GRID_HEIGHT, life)
  end

  # The "rules"
  #  C   N                 new C
  #  1   0,1             ->  0  # Lonely
  #  1   4,5,6,7,8       ->  0  # Overcrowded
  #  1   2,3             ->  1  # Lives
  #  0   3               ->  1  # It takes three to give birth!
  #  0   0,1,2,4,5,6,7,8 ->  0  # Barren
  def determine_fate(x, y)
      cell = @grid.cell(x, y)
      neighbors = @grid.surrounding_cells(x, y)
      score = 0
      neighbors.each {|n| score += n.life_points}
      (cell.alive? && score >= 2 && score <= 3) || (score == 3)
  end

  def draw
    @grid.draw
    draw_hud
  end

  def draw_hud
    if simulation_over?
      @font.draw("Sim all done!", 200, 150, 10, 2, 2)
      @font.draw("#{@status_message} in #{@generation} generations after #{time_in_seconds} seconds!",
      110, 300, 10)
    else
      @font.draw("Time: #{time_in_seconds}", 4, 2, 10)
      @font.draw("Generation: #{@generation}", 540, 2, 10)
    end
  end

  def time_in_seconds
    @time_now - @time_start
  end
end
