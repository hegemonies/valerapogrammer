# frozen_string_literal: true

# Action valera go to work
class GoToWork
  def exec(valera)
    if @mana >= 50
      puts 'I too drunk to work'
      valera
    elsif @fatigue >= 10
      puts 'What do we say work? Not today!!!'
      valera
    else
      valera.cheerfulness=(valera.cheerfulness - 10)
              .mana=(valera.mana - 30)
              .money=(valera.money + 100)
              .fatigue=(valera.money + 70)
    end
  end
end
