class HumanPlayer < Player
  attr_reader :name, :grid
  def initialize (name = "Dave")
    @name = name
  end
end
