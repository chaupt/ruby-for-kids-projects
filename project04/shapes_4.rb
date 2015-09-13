#
# Ruby for Kids Project 4
# Programmed By: Chris Haupt
# Experiment with drawing ASCII art shapes using code.
#

puts "Welcome to Shapes"
print "How big do you want your shape? "
shape_size = gets
shape_size = shape_size.chomp
print "Outside letter: "
outside_letter = gets
outside_letter = outside_letter.chomp
print "Inside letter: "
inside_letter = gets
inside_letter = inside_letter.chomp
puts "About to draw a shape #{shape_size} big"
puts "using #{outside_letter} for the edge"
puts "and #{inside_letter} for the insider"

height = shape_size.to_i
width = shape_size.to_i

1.upto(height) do |row|
  if row  == 1
    puts outside_letter * width
  elsif row == height
    puts outside_letter * width
  else
    middle = inside_letter * (width - 2)
    puts "#{outside_letter}#{middle}#{outside_letter}"
  end
end
