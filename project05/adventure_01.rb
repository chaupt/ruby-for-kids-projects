#
# Ruby for Kids Project 5: Simple Adventure
# Programmed By: Chris Haupt
# A random text adventure game.
#

number_of_rooms_explored  = 1
treasure_count            = 0
damage_points             = 5
escaped                   = false
monster                   = false

puts "You are trapped in the dungeon. Collect treasure and try to escape"
puts "before an evil monster gets you!"
puts "To play, type one of the command choices on each turn."
puts ""

while damage_points > 0 and not escaped do

end

if damage_points > 0
  puts "You escaped! "
  puts "You explored #{number_of_rooms_explored} rooms"
  puts "and found #{treasure_count} treasures."
else
  puts "OH NO! You didn't make it out!"
  puts "You explored #{number_of_rooms_explored} rooms"
  puts "before meeting your doom."
end
