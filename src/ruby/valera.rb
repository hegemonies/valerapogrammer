# frozen_string_literal: true

# Valera
class Valera
  attr_reader :health, :mana, :cheerfulness, :fatigue, :money

  def initialize(health, mana, cheerfulness, fatigue, money)
    @health = health
    @mana = mana
    @cheerfulness = cheerfulness
    @fatigue = fatigue
    @money = money
  end

  def add_health(number)
    return @health = 0 if (@health + number).negative?

    return @health = 100 if @health + number > 100

    @health += number
  end

  def add_mana(number)
    return @mana = 0 if (@mana + number).negative?

    return @mana = 100 if @mana + number > 100

    @mana += number
  end

  def add_cheerfulness(number)
    return @cheerfulness = -10 if @cheerfulness + number < -10

    return @cheerfulness = 10 if @cheerfulness + number > 10

    @cheerfulness += number
  end

  def add_fatigue(number)
    return @fatigue = 0 if (@fatigue + number).negative?

    return @fatigue = 100 if @fatigue + number > 100

    @fatigue += number
  end

  def add_money(number)
    return @money = 0 if (@money + number).negative?

    @money += number
  end

  def go_to_bar
    add_cheerfulness(1)
    add_mana(60)
    add_fatigue(40)
    add_health(-10)
    add_money(-100)
  end

  def drink_with_marginals
    add_cheerfulness(5)
    add_health(-80)
    add_mana(90)
    add_fatigue(80)
    add_money(-150)
  end

  def sing_in_subway
    add_cheerfulness(1)
    add_mana(10)
    add_money(10)
    add_money(50) if @mana > 40 and @mana < 70
    add_fatigue(20)
  end

  def just_sleep
    add_health(90) if @mana < 30
    add_cheerfulness(-3) if @mana > 70
    add_mana(-50)
    add_fatigue(-70)
  end
end
