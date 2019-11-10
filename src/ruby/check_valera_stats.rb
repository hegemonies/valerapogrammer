# frozen_string_literal: true

class CheckValeraStats
  def self.check_health(val)
    return false if val < 0 || val > 100
    true
  end

  def self.check_mana(val)
    return false if val < 0 || val > 100
    true
  end

  def self.check_cheerfulness(val)
    return false if val < -10 || val > 10
    true
  end

  def self.check_fatugie(val)
    return false if val < 0 || val > 100
    true
  end

  def self.check_money(val)
    return false if val < 0
    true
  end
end
