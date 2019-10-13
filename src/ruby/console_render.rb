# frozen_string_literal: true

require './valera'

class ConsoleRender

  def output_welcome
    text = "Welcome to Valera Pogrammer"
    puts text
  end

  def output_help
    puts "To init game from config file use next command:"
    puts "\t" # todo: to write here help info
  end

  def output_actions
    puts "1. Go to work"
    puts "2. See natural"
    puts "3. Drink wino and see serials"
    puts "4. Go to bar"
    puts "5. Drink with marginals"
    puts "6. Sing in subway"
    puts "7. Just sleep"
    puts "8. what is happening here?!"
  end

  def output_stats(valera)
    puts "\e[31mhealth: #{valera.health}\e[0m\t" +
             "\e[34mmana: #{valera.mana}\e[0m\t" +
             "\e[33mcheerfulness: #{valera.cheerfulness}\e[0m\t" +
             "\e[35mfatigue: #{valera.fatigue}\e[0m\t" +
             "\e[32mmoney: #{valera.money}$\e[0m\t"
  end

  def input_action
    put ":) "
    return gets.chomp.to_i
    puts
  end

end
