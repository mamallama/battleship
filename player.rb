class Player < Grid

attr_reader :name, :grid, :ships, :hit, :missed
  def initialize(name) #all players have name... can this just be inherited?
    @name = name
    @grid = Grid.new #for every grid, we need what goes on it. Right?
    @ships = []
    @hit = []
    @missed = []
  end
end
