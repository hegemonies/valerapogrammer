require './console_render'
require './valera'

class Game
  attr :console, :valera
  def initialize
    @console = ConsoleRender.new
    @console.output_welcome

    @valera = Valera.new(health=100, mana=0, cheerfulness=0, fatigue=0, money=200)
  end

  def next_step
    @console.output_stats(@valera)
    @console.output_actions
    action = @console.input_action
    if action == 1
      print "Valera go to work "
      action_in_process
      valera.go_to_work
    elsif action == 2
      print "Valera see of a natural "
      action_in_process
      valera.contemplate_nature
    elsif action == 3
      print "Valera drink wino and see serials "
      action_in_process
      valera.drink_and_watch
    elsif action == 4
      print "Valera go to bar "
      action_in_process
      valera.go_to_bar
    elsif action == 5
      print "Valera go drink with marginals "
      action_in_process
      valera.drink_with_marginals
    elsif action == 6
      print "Valera sing in the subway "
      action_in_process
      valera.sing_in_subway
    elsif action == 7
      print "Valera sleep "
      action_in_process
      valera.just_sleep
    elsif action == 8
      @console.output_help
      return true
    elsif action == 9
      @console.say_bye
      return false
    end
  end

  def action_in_process
    Random.rand(5).times do
      sleep(1)
      print "."
    end
    puts
  end
end
