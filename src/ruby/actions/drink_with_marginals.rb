# frozen_string_literal: true

# Action valera go to bar
class DrinkWithMarginals
  def exec(valera)
    valera.cheerfulness=(valera.cheerfulness + 5)
            .health=(valera.health - 80)
            .mana=(valera.mana + 90)
            .fatigue=(valera.fatigue + 80)
            .money=(valera.fatigue - 150)
  end
end
