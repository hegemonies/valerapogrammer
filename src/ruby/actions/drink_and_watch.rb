# frozen_string_literal: true

# Action valera go to bar
class DringAndWatch
  def exec(valera)
    valera.cheerfulness=(valera.cheerfulness - 1)
            .mana=(valera.mana + 30)
            .fatigue=(valera.fatigue + 10)
            .health=(valera.health - 5)
            .money=(valera.money - 20)
  end
end
