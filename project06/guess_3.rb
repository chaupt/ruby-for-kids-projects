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
