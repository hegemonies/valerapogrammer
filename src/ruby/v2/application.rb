# frozen_string_literal: true

require '../../../src/ruby/v2/app_context'
require '../../../src/ruby/valera'

class Application
  def run
    context = AppContext.new(valera: Valera.new,
                              actions_container: ConfigLoader.load('../resources/config.yml'))
    app_state = AppStates::InputAction.new(context)
    until app_state.app_context.valera.died?
      app_state.render
      app_state = app_state.next
    end
  end
end
