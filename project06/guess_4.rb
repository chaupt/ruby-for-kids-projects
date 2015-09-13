#
# Ruby for Kids Project 6: Guessing Game
# Programmed By: Chris Haupt
# A guessing game with where the hints might not be true
#

class Player
  # Player class code goes here
  def initialize(name)
    @name         = name
    @score        = 0
    prepare_for_new_round
  end

  def prepare_for_new_round
    @total_guess_count  = 0
    @high_number        = 0
    @current_guess      = 0
    @current_number_of_guesses = 0
  end

  def name
    @name
  end

  def score
    @score
  end

  def total_guess_count
    @total_guess_count
  end

  def high_number
    @high_number
  end

  def current_guess
    @current_guess
  end

  def guess_count
    @current_number_of_guesses
  end

  def add_score(points)
    @score += points
  end

  def get_high_number
    @high_number = gets.to_i
  end

  def get_total_guess_count
    @total_guess_count = gets.to_i
  end

  def get_guess
    @current_number_of_guesses += 1
    @current_guess = gets.to_i
  end

end

class Game
  # Game class code goes here
  TOTAL_ROUNDS = 3

  def initialize(player)
    @player = player
    @round = 0
    next_round
  end

  def next_round
    @computers_number = 0
    @round_done = false
    @round += 1
    @player.prepare_for_new_round
  end

  def round
    @round
  end

  def done?
    @round > TOTAL_ROUNDS
  end

  def round_done?
    @round_done
  end

  def get_high_number
    print "I’ll pick a number between 1 and what number? "
    high_number = @player.get_high_number
    if high_number <= 1
      puts "Oops! The number must be larger than 1, try again."
      return false
    else
      return true
    end
  end

end

puts "Welcome to the Guessing Game"
puts "We will play #{Game::TOTAL_ROUNDS} rounds. Try to guess the number"
puts "I'm thinking of in the fewest guesses."
puts "You will also estimate how many guesses it will take"
puts "and if you do it in less, gain bonus points!"
puts ""
print "What is your name? "
name   = gets.chomp
player = Player.new(name)
game   = Game.new(player)

while !game.done? do
  puts ""
  puts "------> Round ##{game.round}"
  puts ""

  if game.get_high_number
    if game.get_guess_count
      game.prepare_computer_number
      while !game.round_done? do
        puts ""
        game.get_player_guess
        game.show_results
      end
      game.next_round
    end
  end
end

puts ""
game.print_final_score

# Challenges
# Quit
# Keep track of total guesses across all rounds
# Change scoring to be based on number of guesses
# Give hints that are "warmer or colder" depending on how far
# => away the player is
