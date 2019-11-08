# frozen_string_literal: true

require './valera'

class ConsoleRender
  def print_welcome
    text = 'Welcome to Valera Pogrammer'
    puts text
  end

  def say_bye
    puts 'Bye bye'
  end

  def print_help
    puts 'To init game from config file use next command:'
    puts '\t' # TODO: to write here help info
  end

  def print_actions
    puts '1. Go to work?                ' +
         coloring_stats('+0', '-30', '-5', '+70', '+100')
    puts '2. See natural                ' +
         coloring_stats('+0', '-10', '+1', '+10', '+0')
    puts '3. Drink wino and see serials ' +
         coloring_stats('-5', '+30', '-1', '+10', '-20')
    puts '4. Go to bar                  ' +
         coloring_stats('-10', '+60', '+1', '+40', '-100')
    puts '5. Drink with marginals       ' +
         coloring_stats('-80', '+90', '+5', '+80', '-150')
    puts '6. Sing in subway             ' +
         coloring_stats('+0', '+10', '+0', '+20', '+10 (+50?)')
    puts '7. Just sleep                 ' +
         coloring_stats('+0 (+90?)', '-50', '+0 (-3?)', '-70', '+0')
    puts '8. what is happening here?!'
    puts '9. Stop this perfect game'
  end

  def print_stats(valera)
    puts coloring_stats(valera.health, valera.mana, valera.cheerfulness, valera.fatigue, valera.money)
  end

  def coloring_stats(health, mana, cheerfulness, fatigue, money)
    text = Colorize.do(Colors::RED, health)
    + Colorize.do(Colors::BLUE, mana)
    + Colorize.do(Colors::YELLOW, cheerfulness)
    + Colorize.do(Colors::MAGENTA, fatigue)
    + Colorize.do(Colors::GREEN, money)
  end

  def input_action
    print ':) '
    gets.chomp.to_i
  end
end
