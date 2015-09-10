class ComputerPlayer < Player
  attr_reader :grid
 def initialize
   @name = "HAL 9000"
   @grid = Grid.new 
 end
end
