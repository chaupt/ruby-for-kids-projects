#
# Ruby For Kids Project 4
# Programmed By: Chris Haupt
# Experiment with drawing ASCII art shapes using code.
#

def triangle( height, outside='x', inside='.')
  1.upto(height) do |row|
    print ' ' * (height - row)
    if row == 1
      puts "#{outside * 2}"
    elsif row == height
      puts outside * height * 2
    else
      middle = inside * (row - 2)
      print "#{outside}#{middle}#{inside}"
      puts "#{inside}#{middle}#{outside}"
    end
  end
end

def rectangle( width, height, outside='x', inside='.')
  1.upto(height) do |row|
    if row  == 1
      puts outside * width
    elsif row == height
      puts outside * width
    else
      middle = inside * (width - 2)
      puts "#{outside}#{middle}#{outside}"
    end
  end
end

print "How Big? "
shape_size = gets
shape_size = shape_size.to_i
print "Outside letter: "
outside_letter = gets
outside_letter = outside_letter.chomp
print "Inside letter: "
inside_letter = gets
inside_letter = inside_letter.chomp
puts "About to draw a shape #{shape_size} big"
puts "using outside pattern #{outside_letter}"
puts "and inside pattern #{inside_letter}"
triangle(shape_size, outside_letter, inside_letter)
rectangle(shape_size * 2, shape_size , outside_letter, inside_letter)
