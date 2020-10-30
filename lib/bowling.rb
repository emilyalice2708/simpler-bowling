class Bowling

  def initialize
    @score = 0
    @rolls = []
  end

  def bowl(pins)
    @rolls << pins
    end_frame if @rolls.length.odd? && pins == 10 && !final_frame?
  end

  def score
    @roll_number = 0
    rolls_length = @rolls.size 
    while @roll_number < rolls_length do
      if strike?
        score_strike
      elsif spare?
        score_spare
      else
        score_regular
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

  def score_strike
    if final_frame?
      score_final_strike
    else
      score_regular_strike
    end
  end

  def score_final_strike
    return unless @rolls[@roll_number + 1] && @rolls[@roll_number + 2]
    @score = 10 + @rolls[@roll_number + 1] + @rolls[@roll_number + 2]
  end

  def score_regular_strike
    return unless @rolls[@roll_number + 2] && @rolls[@roll_number + 3]
    @score = 10 + @rolls[@roll_number + 2] + @rolls[@roll_number + 3]
  end

  def end_frame
    @rolls << nil
  end
  
  def final_frame?
    @rolls.length >= 18
  end

  def score_spare
    @score += 10 + @rolls[@roll_number + 2]
  end

  def score_regular
    return unless @rolls[@roll_number + 1]
    @score += @rolls[@roll_number] + @rolls[@roll_number + 1]
  end

end
