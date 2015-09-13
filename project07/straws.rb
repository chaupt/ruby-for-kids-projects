#
# Ruby for Kids Project 7: Straws
# Programmed By: Chris Haupt
# Elimination round tournament style, avoid the shortest straw or else!
#

class Straw
  SHORT_STRAW = 5
  LONG_STRAW  = 20

  def initialize(size)
    @straw_size = size
  end

  def self.create_bundle(short, long)
    bundle = []

    1.upto(short) do
      bundle << Straw.new(SHORT_STRAW)
    end

    1.upto(long) do
      bundle << Straw.new(LONG_STRAW)
    end

    bundle
  end

  def short?
    @straw_size == SHORT_STRAW
  end

  def appearance
    '=' * @straw_size
  end
end

class Player
  # Attribute accessors are short hand
  # def name
  #   @name
  # end
  attr_reader :name

  # def straw
  #   @straw
  # end
  # def straw=(s)
  #   @straw = s
  # end
  attr_accessor :straw

  def initialize(name)
    @name = name
  end

  def appearance
    "#{straw.appearance} #{name}"
  end

  def short_straw?
    straw.short?
  end
end

class Game
  def initialize(player_names)
    @players = []
    # Generate the players
    player_names.each do |name|
      @players.push(Player.new(name))
    end

    @rounds  = 1
  end

  def done?
    @players.length <= 1
  end

  def show_round_number
    puts ""
    puts "----> Round #{@rounds}"
    puts ""
  end

  def setup_new_bundle
    number_of_players = @players.length
    bundle = Straw.create_bundle(1, number_of_players - 1)
    bundle.shuffle
  end

  # Deal out Straws, using array index
  def play_round
    bundle_of_straws  = setup_new_bundle
    0.upto(@players.length - 1) do |index|
      player = @players[index]
      player.straw = bundle_of_straws.pop
    end
  end

  # Show straws -- using array enumerator
  def show_results
    @players.each do |player|
      puts player.appearance
    end
  end

  #Eliminate the player with the short straw -- using array delete_if
  def finish_round
    @players.delete_if do |player|
      player.short_straw?
    end
    @rounds += 1
  end

  def show_winner
    last_player = @players.first
    puts ""
    puts "The Winner is #{last_player.name}"
    puts ""
  end
end

puts "Welcome to the Last Straw Game"
puts "In each round, players will draw straws of two different lengths."
puts "The player(s) who pick the short straw are eliminated and"
puts "a new round will begin."

PLAYERS = %w(anne bert chris donna ernie franz garfield holden ivy jose)
# PLAYERS = ["anne", "bert", "chris", "donna", "ernie", "franz", "garfield", "holden", "ivy", "jose"]

game = Game.new(PLAYERS)

while !game.done? do
  game.show_round_number
  game.play_round
  game.show_results
  game.finish_round
end

game.show_winner
