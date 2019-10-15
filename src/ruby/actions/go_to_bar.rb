# frozen_string_literal: true

# Action valera go to bar
class GoToBar
  def exec(valera)
    valera.cheerfulness=(valera.cheerfulness + 1)
            .mana=(valera.mana + 60)
            .fatigue=(valera.fatigue + 40)
            .health=(valera.health - 10)
            .money=(valera.money - 100)
  end
end
