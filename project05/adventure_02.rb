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
current_room              = ""

puts "You are trapped in the dungeon, collect treasure and try to escape"
puts "before an evil monster gets you!"
puts "To play, type one of the command choices on each turn."
puts ""

while damage_points > 0 and not escaped do
 actions = ["m - move", "s - search"]
  puts "Room number #{number_of_rooms_explored}"
  puts current_room
  if monster
    puts "Oh no! An evil monster is in here with you!"
    actions << "f - fight"
  end
  print "What do you do? (#{actions.join(', ')}): "

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
