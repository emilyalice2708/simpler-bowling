class Bowling

  def initialize
    @score = 0
  end

  def bowl(pins)
    @score += pins
  end

  def score
    @score
  end
  
end