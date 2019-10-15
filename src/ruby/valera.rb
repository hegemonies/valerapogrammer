# frozen_string_literal: true

# Valera
class Valera
  attr_accessor :health, :mana, :cheerfulness, :fatigue, :money

  def initialize(health: 0, mana: 0, cheerfulness: 0, fatigue: 0, money: 0)
    @health = health
    @mana = mana
    @cheerfulness = cheerfulness
    @fatigue = fatigue
    @money = money
  end

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
    return @fatigue = 0 if @fatigue.negative?
    return @fatigue = 100 if @fatigue > 100
    @fatigue = number
    self
  end

  def money=(number)
    return @money = 0 if @money.negative?
    @money = number
    self
  end






  def just_sleep
    add_health(90) if @mana < 30
    add_cheerfulness(-3) if @mana > 70
    add_mana(-50)
    add_fatigue(-70)
  end
end
