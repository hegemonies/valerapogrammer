# frozen_string_literal: true

# Action valera sleep
class JustSleep
  def do(valera)
    ValeraBuilder.build do |builder|
      builder.set_health(valera.health + 90) if valera.mana < 30
      builder.set_cheerfulness(valera.cheerfulness - 3) if valera.mana > 70
      builder.set_mana(valera.mana - 50)
      builder.set_fatigue(valera.fatigue - 70)
    end
  end
end
