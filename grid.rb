class Grid
  def initialize
    @ships = []
  end

  def has_ship_on?(x,y)
    @ships.each do |ship|
      return true if ship.covers?(x, y)
    end
    false
  end

  def place_ship(ship, x, y, horizontal)
    ship.place(x, y, horizontal)
    overlaps = false
    @ships.each do |s|
      if s.overlaps_with?(ship)
        overlaps = true
      end
    end
    unless overlaps
      @ships << ship
    end
  end

  def display

    #loop through rows, in each row, loop through columns
    puts %Q{    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------}
    letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    (0..9).each do |row|
      output = "#{letters[row]} |"
      (0..9).each do |column|
        output += "   |"
      end
      puts output
    end
    puts "  -----------------------------------------"
  end

#   def empty_grid
# %Q{    1   2   3   4   5   6   7   8   9   10
#   -----------------------------------------
# A |   |   |   |   |   |   |   |   |   |   |
# B |   |   |   |   |   |   |   |   |   |   |
# C |   |   |   |   |   |   |   |   |   |   |
# D |   |   |   |   |   |   |   |   |   |   |
# E |   |   |   |   |   |   |   |   |   |   |
# F |   |   |   |   |   |   |   |   |   |   |
# G |   |   |   |   |   |   |   |   |   |   |
# H |   |   |   |   |   |   |   |   |   |   |
# I |   |   |   |   |   |   |   |   |   |   |
# J |   |   |   |   |   |   |   |   |   |   |
#   -----------------------------------------
# }
#   end
#

end
  # def place_ship(ship_object, number1, number2, x = false)
  #
  # end
