# frozen_string_literal: true

# Action valera drink and watch
class DrinkAndWatch
  def do(valera)
    SimulateAction.do
    ValeraBuilder.build do |builder|
      builder.set_cheerfulness(valera.cheerfulness - 1)
      builder.set_mana(valera.mana + 30)
      builder.set_fatigue(valera.fatigue + 10)
      builder.set_health(valera.health - 5)
      builder.set_money(valera.money - 20)
    end
  end
end
