# frozen_string_literal: true

# Action valera go to bar
class ContemplateNature
  def exec(valera)
    valera.cheerfulness=(valera.cheerfulness + 1)
            .mana(valera.mana - 10)
            .fatigue(valera.fatigue + 10)
  end
end
