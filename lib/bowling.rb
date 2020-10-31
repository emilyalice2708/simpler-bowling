class Bowling
  def initialize
    @score, @game_length, @roll_number = 0, 0, 0
    @rolls = []
  end

  def bowl(pins)
    @rolls << pins
    game_tracker(pins)
  end

  def score
    calculate_score
    @score
  end

  private

  def calculate_score
    game_length.times do
      if strike?
        score_strike
      elsif spare?
        score_spare
      else
        score_regular
      end
      @roll_number += 2
    end
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
    @score += 10 + @rolls[@roll_number + 1] + @rolls[@roll_number + 2]
  end

  def score_regular_strike
    return unless @rolls[@roll_number + 2] && @rolls[@roll_number + 3]
    second_bonus = followed_by_strike ? @rolls[@roll_number + 4] : @rolls[@roll_number + 3]
    @score += 10 + @rolls[@roll_number + 2] + second_bonus
  end

  def followed_by_strike
    @rolls[@roll_number + 2] == 10 && @rolls[@roll_number + 3] == 0
  end
  
  def final_frame?
    @rolls.length >= 18
  end

  def game_length
    @game_length.ceil
  end

  def close_frame
    @rolls << 0
    @game_length += 1
  end

  def increment_frame
    @game_length += 0.5
  end
  
  def game_tracker(pins)
    first_roll? && pins == 10 && !final_frame? ? close_frame : increment_frame
  end

  def first_roll?
    @rolls.length.odd?
  end
end