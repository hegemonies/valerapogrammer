# frozen_string_literal: true

require './app_context'
require './valera'
require './config_loader'
require './app_states'
require './input_state'

class Application
  def run
    context = AppContext.new(valera: Valera.new,
                             actions_container: ConfigLoader.load('resources/config.yml'),
                             prev_data: nil)
    app_state = AppStates::InputAction.new(context)
    loop do
      app_state.render
      app_state = app_state.next
      break if app_state.app_context.valera.died?
    end
  end
end
