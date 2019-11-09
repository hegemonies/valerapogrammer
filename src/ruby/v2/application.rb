# frozen_string_literal: true

require '../v2/app_context'
require '../valera'

class Application
  def run
    context = AppContext.new(valera: Valera.new,
                              actions_container: ConfigLoader.load('../resources/config.yml'),
                              prev_data: nil)
    app_state = AppStates::InputAction.new(context)
    until app_state.app_context.valera.died?
      app_state.render
      app_state = app_state.next
    end
  end
end
