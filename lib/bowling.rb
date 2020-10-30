class Bowling

  def initialize
    @score = 0
    @rolls = []
  end

  def bowl(pins)
    @rolls << pins
  end

  def score
    roll_number = 0
    rolls_length = @rolls.size 
    while roll_number < rolls_length do
      if @rolls[roll_number] + @rolls[roll_number] == 10
        @score += 10 + @rolls[roll_number + 2]
      else
        @score += @rolls[roll_number] + @rolls[roll_number + 1]
      end
      roll_number += 2
    end
    @score
  end

end