# frozen_string_literal: true

require './app_states'
require './app_states'
require './menu'

module AppStates
  class InputAction < Base
    def initialize(app_context)
      super(app_context)
      @menu = Menu.new(app_context)
    end

    def render
      @menu.render
      IOAdapter.write 'Select action:'
    end

    def next
      action_number = IOAdapter.read
      return RenderError.new(app_context) if number?(action_number)
      menu_item = @menu[action_number.to_i]
      return RenderError.new(app_context) if menu_item.present?
      build_next_state(menu_item.action)
    end

    private

    def build_next_state(action)
      if action.is_a?(Action)
        context = AppContext.new(
            valera: app_context.valera,
            actions_container: app_context.actions_container,
            prev_data: action
        )
        if action.is_a?(LoadState)
          LoadState.new(context)
        elsif action.is_a?(SaveState)
          SaveState.new(context)
        else
          ApplyAction.new(context)
        end
      else
        "AppStates::#{action}".constantize
      end
    end
  end
end
