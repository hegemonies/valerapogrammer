# frozen_string_literal: true

# Action valera go to work
class GoToWork
  def do(valera)
    if valera.mana >= 50
      puts 'I too drunk to work'
      valera
    elsif valera.fatigue >= 10
      puts 'What do we say work? Not today!!!'
      valera
    else
      ValeraBuilder.build do |builder|
        builder.set_cheerfulness(valera.cheerfulness - 10)
        builder.set_mana(valera.mana - 30)
        builder.set_fatigue(valera.fatigue + 70)
        builder.set_money(valera.money + 100)
      end
    end
  end
end
