# frozen_string_literal: true

# just Valera
class Valera
  attr_accessor :health, :mana, :cheerfulness, :fatigue, :money

  def health=(number)
    return @health = 0 if number.negative?
    return @health = 100 if number > 100
    @health = number
    self
  end

  def mana=(number)
    return @mana = 0 if number.negative?
    return @mana = 100 if number > 100
    @mana = number
    self
  end

  def cheerfulness=(number)
    return @cheerfulness = -10 if number < -10
    return @cheerfulness = 10 if number > 10
    @cheerfulness = number
    self
  end

  def fatigue=(number)
    return @fatigue = 0 if number.negative?
    return @fatigue = 100 if number > 100
    @fatigue = number
    self
  end

  def money=(number)
    return @money = 0 if number.negative?
    @money = number
    self
  end
end
