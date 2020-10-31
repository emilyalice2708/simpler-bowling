class Bowling
  def initialize
    @score = 0
    @rolls = []
    @game_length = 0
  end

  def bowl(pins)
    @rolls << pins
    if @rolls.length.odd? && pins == 10 && !final_frame?
      end_frame
      @game_length += 1
    else 
      @game_length += 0.5
    end
  end

  def score
    @roll_number = 0
    frame_count.times do
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
    return unless @rolls[@roll_number + 1]
    @rolls[@roll_number] + @rolls[@roll_number + 1] == 10
  end

  def score_regular
    return unless @rolls[@roll_number + 1]
    @score += @rolls[@roll_number] + @rolls[@roll_number + 1]
  end

  def score_spare
    @score += 10 + @rolls[@roll_number + 2]
  end

  def score_strike
    @roll_number == 18 ? score_final_strike : score_regular_strike
  end

  def score_final_strike
    return unless @rolls[@roll_number + 1] && @rolls[@roll_number + 2]
    @score += 10 + @rolls[@roll_number + 1] + @rolls[@roll_number + 2]
  end

  def score_regular_strike
    if @rolls[@roll_number + 2] == 10 && @rolls[@roll_number + 3] == 0
      @score += 10 + @rolls[@roll_number + 2] + @rolls[@roll_number + 4]
    else
      return unless @rolls[@roll_number + 2] && @rolls[@roll_number + 3]
      @score += 10 + @rolls[@roll_number + 2] + @rolls[@roll_number + 3]
    end
  end

  def end_frame
    @rolls << 0
  end
  
  def final_frame?
    @rolls.length >= 18
  end

  def frame_count
    @game_length.ceil
  end
end