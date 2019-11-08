# frozen_string_literal: true

require '../actions/simulate_action'

# Action valera go to bar
class GoToBar
  def do(valera)
    SimulateAction.do
    ValeraBuilder.build do |builder|
      builder.set_cheerfulness(valera.cheerfulness + 1)
      builder.set_mana(valera.mana + 60)
      builder.set_fatigue(valera.fatigue + 40)
      builder.set_health(valera.health - 10)
      builder.set_money(valera.money - 100)
    end
  end
end
