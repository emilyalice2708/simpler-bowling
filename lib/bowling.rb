class Bowling

  def initialize
    @score = 0
    @rolls = []
  end

  def bowl(pins)
    @rolls << pins
  end

  def score
    @roll_number = 0
    rolls_length = @rolls.size 
    while @roll_number < rolls_length do
      if spare?
        spare_bonus
      else
        @score += @rolls[@roll_number] + @rolls[@roll_number + 1]
      end
      @roll_number += 2
    end
    @score
  end

  def spare?
    @rolls[@roll_number] + @rolls[@roll_number] == 10
  end

  def spare_bonus
    @score += 10 + @rolls[@roll_number + 2]
  end

end