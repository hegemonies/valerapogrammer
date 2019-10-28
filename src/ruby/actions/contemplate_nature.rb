# frozen_string_literal: true

# Action valera contemplate nature
class ContemplateNature
  def do(valera)
    ValeraBuilder.build do |builder|
      builder.set_cheerfulness(valera.cheerfulness + 1)
      builder.set_mana(valera.mana - 10)
      builder.set_fatigue(valera.fatigue + 10)
    end
  end
end
