# frozen_string_literal: true

# Action valera drink with marginals
class DrinkWithMarginals
  def do(valera)
    ValeraBuilder.build do |builder|
      builder.set_cheerfulness(valera.cheerfulness + 5)
      builder.set_health(valera.health - 80)
      builder.set_mana(valera.mana + 90)
      builder.set_fatigue(valera.fatigue + 80)
      builder.set_money(valera.money - 150)
    end
  end
end
