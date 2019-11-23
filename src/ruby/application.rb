# frozen_string_literal: true

require './app_context'
require './valera'
require './config_loader'
require './app_states'
require './input_state'
require './game_over_state'

class Application
  def run
    context = AppContext.new(valera: Valera.new,
                             actions_container: ConfigLoader.load('resources/config.yml'),
                             prev_data: nil)
    app_state = AppStates::InputAction.new(context)
    loop do
      app_state.render
      app_state = app_state.next
      if app_state.app_context.valera.died?
        IOAdapter.writeln 'Valera is dead :('
        break
      end
    end
  end
end
