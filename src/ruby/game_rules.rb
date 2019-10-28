# frozen_string_literal: true

# Handle game rules
class GameRules
  def check_state_valera(valera)
    raise 'Valera died' if valera.health <= 0
    puts 'Valera are like a glass' if valera.mana <= 10
    puts 'Valera is too drunk' if valera.mana > 70
    puts 'Valera is sad' if valera.cheerfulness <= 0
    puts 'Valera is funny' if valera.cheerfulness > 0
    puts 'Valera have a full power like a power-ranger' if valera.fatigue > 50
    puts 'Valera is tired' if valera.fatigue < 20
    puts 'Valera Bankrupt' if valera.money == 0
  end
end
