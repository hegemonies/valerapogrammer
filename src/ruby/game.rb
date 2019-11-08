# frozen_string_literal: true

require './console_render'
require './valera'
require '../ruby/game_rules'

# Main GAME class
class Game
  attr_reader :console, :valera, :game_rules

  def initialize
    @console = ConsoleRender.new
    @console.print_welcome
    @game_rules = GameRules.new
  end

  def default
    @valera = ValeraBuilder.build do |builder|
      builder.set_health 100
      builder.set_mana 0
      builder.set_cheerfulness 0
      builder.set_fatigue 0
      builder.set_money 0
    end
    self
  end

  def start
    begin
      while next_step != false
      end
    end
  rescue StandardError => e
    puts 'Sorry, buddy, this is GAME OVER :('
    # print detail.backtrace.join("\n")
  end

  def next_step
    @game_rules.check_state_valera @valera
    @console.print_stats @valera
    @console.print_actions
    process_action
  end

  def process_action
    action = @console.input_action
    case action
    when Action::GO_TO_WORK
      @valera = GoToWork.do @valera
    when Action::CONTEMPLATE_NATURE
      @valera = ContemplateNature.do @valera
    when Action::DRINK_AND_WATCH
      @valera = DrinkAndWatch.do @valera
    when Action::GO_TO_BAR
      @valera = GoToBar.do @valera
    when Action::DRINK_WITH_MARGINALS
      @valera = DrinkWithMarginals.do @valera
    when Action::SING_IN_SUBWAY
      @valera = SingInSubway.do @valera
    when Action::JUST_SLEEP
      @valera = JustSleep.do @valera
    when Action::HELP
      @console.print_help
    when Action::QUIT
      @console.say_bye
      false
    end
  end
end
