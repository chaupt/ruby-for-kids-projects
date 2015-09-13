#
# Ruby for Kids Project 6: Guessing Game
# Programmed By: Chris Haupt
# A guessing game with where the hints might not be true
#

class Player
  # Player class code goes here
end

class Game
  # Game class code goes here
  TOTAL_ROUNDS = 3
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
