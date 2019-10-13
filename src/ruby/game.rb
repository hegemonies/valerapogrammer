require './console_render'
require './valera'

class Game
  attr :console, :valera
  def initialize
    @console = ConsoleRender.new
    @console.output_welcome

    @valera = Valera.new(health=100, mana=0, cheerfulness=0, fatigue=0, money=200)
  end

  def next
    @console.output_stats(@valera)
    @console.output_actions
    action = @console.input_action
    if action == 1
      # todo: to write action one
    end
  end
end
