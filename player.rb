require './grid'
class Player

attr_reader :name, :grid, :ships, :hit, :misses
  def initialize#(name) #all players have name... can this just be inherited?
    #@name = name
    @grid = Grid.new #for every grid, we need what goes on it, right?
    @ships = []
    @hit = []
    @misses = []
  end
end
