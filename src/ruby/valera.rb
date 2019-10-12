
class Valera
  attr_reader :fatigue, :money

  def initialize(fatigue, money)
    @fatigue = fatigue
    @money = money
  end

  def add_fatigue(number)
    if @fatigue + number < 0
      return @fatigue = 0
    end

    if @fatigue + number > 100
      return @fatigue = 100
    end

    @fatigue += number
  end

  def add_money(number)
    if @money + number < 0
      return @money = 0
    end

    @money += number
  end
end
