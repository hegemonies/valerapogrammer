# frozen_string_literal: true

# Action valera go to bar
class SingInSubway
  def exec(valera)
    valera.cheerfulness=(valera.cheerfulness + 1)
            .mana=(valera.mana + 10)
            .money=(valera.money + 10)
            .fatigue=(valera.fatigue + 20)
    valera.money=(valera.money + 50) if @mana > 40 and @mana < 70
  end
end
