class Player
  attr_accessor :lives, :name, :points
    def initialize(name)
      @name = name
      @lives = 3
      @points = 0
    end
    def lose_life
      @lives -= 1
    end
    def add_point
      @points += 1
    end
end