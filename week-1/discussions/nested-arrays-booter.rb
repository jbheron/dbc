# - problem approach
# - data structures
# - sort yourself

roster = [["Number", "Name", "Position", "Points per Game"],
         ["12","Joe Schmo","Center",[14, 32, 7, 0, 23] ],
         ["9", "Ms. Buckets ", "Point Guard", [19, 0, 11, 22, 0] ],
         ["31", "Harvey Kay", "Shooting Guard", [0, 30, 16, 0, 25] ],
         ["7", "Sally Talls", "Power Forward ", [18, 29, 26, 31, 19] ],
         ["22", "MK DiBoux ", "Small Forward ", [11, 0, 23, 17, 0] ]]

# strategy 1: literally building the goal
  # roster[0][0] => roster[1][0],  ...

  # - brittle
  # - tedious
  # - hard to read later
  # - hard to scale

# aside: learn to manipulate this data using Ruby methods
  # p roster
  # p roster[0]
  # p headers = roster.shift

# ------------------------------------------------------------------------
# ------------------------------------------------------------------------
# strategy 2: separate the header from the rows then recombine
# ------------------------------------------------------------------------

# p roster
header = roster.shift

# ------------------------------------------------------------------------

# roster.each do |row|
#   p header.zip(row)
# end

# [["Number", "12"], ["Name", "Joe Schmo"], ["Position", "Center"], ["Points per Game", [14, 32, 7, 0, 23]]]
# [["Number", "9"], ["Name", "Ms. Buckets "], ["Position", "Point Guard"], ["Points per Game", [19, 0, 11, 22, 0]]]
# [["Number", "31"], ["Name", "Harvey Kay"], ["Position", "Shooting Guard"], ["Points per Game", [0, 30, 16, 0, 25]]]
# [["Number", "7"], ["Name", "Sally Talls"], ["Position", "Power Forward "], ["Points per Game", [18, 29, 26, 31, 19]]]
# [["Number", "22"], ["Name", "MK DiBoux "], ["Position", "Small Forward "], ["Points per Game", [11, 0, 23, 17, 0]]]

# p Hash[[["Number", "12"], ["Name", "Joe Schmo"], ["Position", "Center"], ["Points per Game", [14, 32, 7, 0, 23]]]]

# {"Number"=>"12", "Name"=>"Joe Schmo", "Position"=>"Center", "Points per Game"=>[14, 32, 7, 0, 23]}


# ------------------------------------------------------------------------

# roster.each do |row|
#   p Hash[header.zip(row)]
# end

# {"Number"=>"12", "Name"=>"Joe Schmo", "Position"=>"Center", "Points per Game"=>[14, 32, 7, 0, 23]}
# {"Number"=>"9", "Name"=>"Ms. Buckets ", "Position"=>"Point Guard", "Points per Game"=>[19, 0, 11, 22, 0]}
# {"Number"=>"31", "Name"=>"Harvey Kay", "Position"=>"Shooting Guard", "Points per Game"=>[0, 30, 16, 0, 25]}
# {"Number"=>"7", "Name"=>"Sally Talls", "Position"=>"Power Forward ", "Points per Game"=>[18, 29, 26, 31, 19]}
# {"Number"=>"22", "Name"=>"MK DiBoux ", "Position"=>"Small Forward ", "Points per Game"=>[11, 0, 23, 17, 0]}

# ------------------------------------------------------------------------

# roster.map! do |row|
#   Hash[header.zip(row)]
# end

# p roster


# [
#  {"Number"=>"12", "Name"=>"Joe Schmo", "Position"=>"Center", "Points per Game"=>[14, 32, 7, 0, 23]},
#  {"Number"=>"9", "Name"=>"Ms. Buckets ", "Position"=>"Point Guard", "Points per Game"=>[19, 0, 11, 22, 0]},
#  {"Number"=>"31", "Name"=>"Harvey Kay", "Position"=>"Shooting Guard", "Points per Game"=>[0, 30, 16, 0, 25]},
#  {"Number"=>"7", "Name"=>"Sally Talls", "Position"=>"Power Forward ", "Points per Game"=>[18, 29, 26, 31, 19]},
#  {"Number"=>"22", "Name"=>"MK DiBoux ", "Position"=>"Small Forward ", "Points per Game"=>[11, 0, 23, 17, 0]}
# ]


# -- DONE ----------------------------------------------------------------------

# let's do it on 2 lines

p header
p roster.map {|row| header.zip row }.map { |row| Hash[new_row] }

# [
#  {"Number"=>"12", "Name"=>"Joe Schmo", "Position"=>"Center", "Points per Game"=>[14, 32, 7, 0, 23]},
#  {"Number"=>"9", "Name"=>"Ms. Buckets ", "Position"=>"Point Guard", "Points per Game"=>[19, 0, 11, 22, 0]},
#  {"Number"=>"31", "Name"=>"Harvey Kay", "Position"=>"Shooting Guard", "Points per Game"=>[0, 30, 16, 0, 25]},
#  {"Number"=>"7", "Name"=>"Sally Talls", "Position"=>"Power Forward ", "Points per Game"=>[18, 29, 26, 31, 19]},
#  {"Number"=>"22", "Name"=>"MK DiBoux ", "Position"=>"Small Forward ", "Points per Game"=>[11, 0, 23, 17, 0]}
# ]

# strategy 3: build objects that represent each hash in the goal and have them render themselves as a hash (to_h)


# GOAL:
# [
#   { "Number" => 31, "Name" => "Harvey Kay", "Position" => "Shooting Guard", "Points per Game" => [0, 30, 16, 0, 25] },
#   { "Number" => 31, "Name" => "Harvey Kay", "Position" => "Shooting Guard", "Points per Game" => [0, 30, 16, 0, 25] },
#   { "Number" => 31, "Name" => "Harvey Kay", "Position" => "Shooting Guard", "Points per Game" => [0, 30, 16, 0, 25] },
#   { "Number" => 31, "Name" => "Harvey Kay", "Position" => "Shooting Guard", "Points per Game" => [0, 30, 16, 0, 25] },
#   { "Number" => 31, "Name" => "Harvey Kay", "Position" => "Shooting Guard", "Points per Game" => [0, 30, 16, 0, 25] }
# ]

# 1. identifying a clear goal and measures of success
# 2. identify available strategies then decide on a strategy
