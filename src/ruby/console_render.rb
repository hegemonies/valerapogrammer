# frozen_string_literal: true

require './valera'

class ConsoleRender

  def output_welcome
    text = "Welcome to Valera Pogrammer"
    puts text
  end

  def say_bye
    puts "Bye bye"
  end

  def output_help
    puts "To init game from config file use next command:"
    puts "\t" # todo: to write here help info
  end

  def output_actions
    puts "1. Go to work?                " +
             color_stats("+0", "-30", "-5", "+70", "+100")
    puts "2. See natural                " +
             color_stats("+0", "-10", "+1", "+10", "+0")
    puts "3. Drink wino and see serials " +
             color_stats("-5", "+30", "-1", "+10", "-20")
    puts "4. Go to bar                  " +
             color_stats("-10", "+60", "+1", "+40", "-100")
    puts "5. Drink with marginals       " +
             color_stats("-80", "+90", "+5", "+80", "-150")
    puts "6. Sing in subway             " +
             color_stats("+0", "+10", "+0", "+20", "+10 (+50?)")
    puts "7. Just sleep                 " +
             color_stats("+0 (+90?)", "-50", "+0 (-3?)", "-70", "+0")
    puts "8. what is happening here?!"
    puts "9. Stop this perfect game"
  end

  def output_stats(valera)
    puts "\e[31mhealth: #{valera.health}\e[0m\t" +
             "\e[34mmana: #{valera.mana}\e[0m\t" +
             "\e[33mcheerfulness: #{valera.cheerfulness}\e[0m\t" +
             "\e[35mfatigue: #{valera.fatigue}\e[0m\t" +
             "\e[32mmoney: #{valera.money}$\e[0m\t"
  end

  def color_stats(health, mana, cheerfulness, fatigue, money)
    return "(\e[31m#{health}\e[0m " +
             "\e[34m#{mana}\e[0m " +
             "\e[33m#{cheerfulness}\e[0m " +
             "\e[35m#{fatigue}\e[0m " +
             "\e[32m#{money}\e[0m)"

  end

  def input_action
    print ":) "
    return gets.chomp.to_i
    puts
  end

end
