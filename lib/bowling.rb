class Bowling

  def initialize
    @score = 0
    @rolls = []
  end

  def bowl(pins)
    @rolls << pins
    if @rolls.length.odd? && pins == 10
      @rolls << nil
    end
  end

  def score
    @roll_number = 0
    rolls_length = @rolls.size 
    while @roll_number < rolls_length do
      if strike?
        strike_bonus
      elsif spare?
        spare_bonus
      else
        regular_frame
      end
      @roll_number += 2
    end
    @score
  end

  def strike?
    @rolls[@roll_number] == 10
  end

  def spare?
    @rolls[@roll_number] + @rolls[@roll_number] == 10
  end

  def strike_bonus
    @score = 10 + @rolls[@roll_number + 2] + @rolls[@roll_number + 3]
  end

  def spare_bonus
    @score += 10 + @rolls[@roll_number + 2]
  end

  def regular_frame
    return unless @rolls[@roll_number + 1]
    @score += @rolls[@roll_number] + @rolls[@roll_number + 1]
  end

end
