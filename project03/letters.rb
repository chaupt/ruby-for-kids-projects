$ irb
2.2.2 :001 > a = "   A   "
 => "   A   "
2.2.2 :002 > a1 = "   A   "
 => "   A   "
2.2.2 :003 > a2 = "  A A  "
 => "  A A  "
2.2.2 :004 > a3 = " AAAAA "
 => " AAAAA "
2.2.2 :005 > a4 = "A     A"
 => "A     A"
2.2.2 :006 > a1 + a2 + a3 + a4
 => "   A     A A   AAAAA A     A"
2.2.2 :007 > [a1, a2, a3, a4].join("\n")
 => "   A   \n  A A  \n AAAAA \nA     A"
2.2.2 :008 > puts [a1, a2, a3, a4].join("\n"
2.2.2 :009?>   )
   A
  A A
 AAAAA
A     A
 => nil
2.2.2 :010 > puts a1 + a2 + a3 + a4
   A     A A   AAAAA A     A
 => nil
2.2.2 :011 > a = "#{a1}\n#{a2}\n#{a3}\n#{a4}"
 => "   A   \n  A A  \n AAAAA \nA     A"
2.2.2 :012 > puts a
   A
  A A
 AAAAA
A     A
 => nil

h1 = "H       H"
h2 = "H       H"
h3 = "H       H"
h4 = "HHHHHHHHH"
h5 = h1
h6 = h1
h7 = h1
h = [h1,h2,h3,h4,h5,h6,h7]

puts [h1,h2,h3,h4,h5,h6,h7].join("\n")

H       H
H       H
H       H
HHHHHHHHH
H       H
H       H
H       H
 => nil
2.2.2 :021 > h = [h1,h2,h3,h4,h5,h6,h7].join("\n")
 => "H       H\nH       H\nH       H\nHHHHHHHHH\nH       H\nH       H\nH       H"

e1 = "EEEEEEEEE"
e2 = "E        "
e3 = e2
e4 = e1
e5 = e2
e6 = e2
e7 = e1
e = [e1,e2,e3,e4,e5,e6,e7]

.join("\n")
puts e
EEEEEEEEE
E
E
EEEEEEEEE
E
E
EEEEEEEEE
 => nil
2.2.2 :041 > puts h + e
H       H
H       H
H       H
HHHHHHHHH
H       H
H       H
H       HEEEEEEEEE
E
E
EEEEEEEEE
E
E
EEEEEEEEE
 => nil
2.2.2 :043 > puts h + "\n\n" + e
H       H
H       H
H       H
HHHHHHHHH
H       H
H       H
H       H

EEEEEEEEE
E
E
EEEEEEEEE
E
E
EEEEEEEEE
 => nil

0.upto(7) do |count|
  puts "#{h[count]}  #{e[count]}"
end

H       H EEEEEEEEE
H       H E
H       H E
HHHHHHHHH EEEEEEEEE
H       H E
H       H E
H       H EEEEEEEEE

l1 = "L        "
l7 = "LLLLLLLLL"
l = [l1,l1,l1,l1,l1,l1,l7]

o1 = "   OOO   "
o2 = "  O   O  "
o3 = " O     O "
o4 = o3
o5 = o3
o6 = o2
o7 = o1
o = [o1,o2,o3,o4,o5,o6,o7]

0.upto(6) do |count|
  puts "#{h[count]} #{e[count]} #{l[count]} #{l[count]} #{o[count]}"
end

0.upto(6) do |count|
  puts h[count] + " " + e[count] + " " + l[count] + " " + l[count] + " " + o[count]
end

puts "#{h[0]} #{e[0]} #{l[0]} #{l[0]} #{o[0]}"
puts "#{h[1]} #{e[1]} #{l[1]} #{l[1]} #{o[1]}"
