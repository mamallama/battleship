class Grid

  def initialize
    @ships = []
    @ship_coords = []
  end

  def display
    y = 0
    puts %Q{    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------}
    letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    (0..9).each do |row|
      output = "#{letters[row]} |"
      (0..9).each do |column|
        if @ship_coords.include?([column+1, row+1])
          output += " X |"
        elsif has_ship_on?(column+1, row+1)
          output += " O |"
        else
          output += "   |"
        end
      end
      puts output
    end
      puts "  -----------------------------------------"
  end

  def place_ship(ship, x, y, horizontal)
    ship.place(x, y, horizontal)
    overlap = false
    @ships.each do |s|
        if ship.overlaps_with?(s)
          overlap = true
        end
      end
    unless overlap
      @ships << ship
    end
  end

  def has_ship_on?(x, y)
    # Loops over all ships to check if the coordinate (x, y) is in @positions array of any of them
    @ships.each do |ship|
      return true if ship.covers?(x, y)
    end
    false
  end

  def fire_at(x, y)
    if !has_ship_on?(x, y)
      return false
    elsif @ship_coords.include?([x, y])
      return false
    elsif
      @ships.each do |i|
        @ships.include?(i.covers?(x, y))
      end
      @ship_coords << [x, y]
      return true
    else
    end
  end

  def sunk?
    grid_occupied = false
    if has_ship_on
      grid_occupied = true
    end
    return false if @ships.length == 0
    # Loops over all ships to check if sunk? method returns true.
    @ships.reject(&:sunk?).length == 0 # return true when all ships are sunk
  end

  def x_of(coordinates)
    coordinates.slice(1..coordinates.length).to_i
  end

  def y_of(coordinates)
    letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    y = coordinates[0]
    letters.each_with_index do |k, index|
      if y == k
        return (index + 1)
      end
    end
  end
end
# class Grid
#   attr_reader :misses, :hits, :ships
#
#   def initialize
#     @ships = []
#     @hits = []
#     @misses = []
#   end
#
#   def has_ship_on?(x,y)
#     @ships.each do |ship|
#       return true if ship.covers?(x, y)
#     end
#     false
#   end
#
#   def place_ship(ship, x, y, horizontal)
#     ship.place(x, y, horizontal)
#     overlaps = false
#     @ships.each do |s|
#       if s.overlaps_with?(ship)
#         overlaps = true
#       end
#     end
#     unless overlaps
#       @ships << ship
#     end
#   end
#
#   def display
#     y = 0
#     #loop through rows, in each row, loop through columns
#     puts %Q{    1   2   3   4   5   6   7   8   9   10
#   -----------------------------------------}
#     letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
#
#     (1..10).each do |row|
#       output = "#{letters[row-1]} |"
#       (1..10).each do |column|
#         if has_ship_on?(column, row)
#           output += " O |"
#         else
#           output += "   |"
#         end
#       end
#       puts output
#     end
#     puts "  -----------------------------------------"
#   end
#
# #   def empty_grid
# # %Q{    1   2   3   4   5   6   7   8   9   10
# #   -----------------------------------------
# # A |   |   |   |   |   |   |   |   |   |   |
# # B |   |   |   |   |   |   |   |   |   |   |
# # C |   |   |   |   |   |   |   |   |   |   |
# # D |   |   |   |   |   |   |   |   |   |   |
# # E |   |   |   |   |   |   |   |   |   |   |
# # F |   |   |   |   |   |   |   |   |   |   |
# # G |   |   |   |   |   |   |   |   |   |   |
# # H |   |   |   |   |   |   |   |   |   |   |
# # I |   |   |   |   |   |   |   |   |   |   |
# # J |   |   |   |   |   |   |   |   |   |   |
# #   -----------------------------------------
# # }
# #   end
# #
#   def fire_at(x,y)
#
#       if !has_ship_on?(x,y) #can this be @ships.empty?
#         return false
#       elsif @ships.each do |i|
#         @ships.include?(i.covers?(x,y))
#       end
#       return true
#     elsif @ship_coords.include?([x, y])
#       return false
#     elsif
#       @ships.each do |i|
#         @ships.include?(i.covers?(x, y))
#       end
#       @ship_coords << [x, y]
#       return true
#     else
#     end
#   end
#   def sunk?
#     return false if @ships.length == 0
#     # Loops over all ships to check if sunk? method returns true.
#     @ships.reject(&:sunk?).length == 0 # return true when all ships are sunk
#   end
# end
#   # def place_ship(ship_object, number1, number2, x = false)
#   #
#   # end
