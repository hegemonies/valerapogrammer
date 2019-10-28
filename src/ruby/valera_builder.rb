# frozen_string_literal: true
require '../ruby/valera'

# Valera builder
class ValeraBuilder
  def self.build
    builder = new
    yield(builder)
    builder.valera
  end

  def initialize
    @valera = Valera.new
  end

  def set_health(health)
    @valera.health = health
  end

  def set_mana(mana)
    @valera.mana = mana
  end

  def set_cheerfulness(cheerfulness)
    @valera.cheerfulness = cheerfulness
  end

  def set_fatigue(fatigue)
    @valera.fatigue = fatigue
  end

  def set_money(money)
    @valera.money = money
  end

  def valera
    @valera
  end
end
