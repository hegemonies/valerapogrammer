# frozen_string_literal: true

# Action valera sing in subway
class SingInSubway
  def do(valera)
    SimulateAction.do
    ValeraBuilder.build do |builder|
      builder.set_cheerfulness(valera.cheerfulness + 1)
      builder.set_mana(valera.mana + 10)
      builder.set_money(valera.money + 10)
      builder.set_fatigue(valera.fatigue + 20)
      builder.set_money(valera.money + 50) if @mana > 40 and @mana < 70
    end
  end
end
