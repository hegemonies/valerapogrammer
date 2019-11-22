# frozen_string_literal: true

require './app_states'
require './load_state'
require './save_state'
require './apply_action_state'
require './menu'
require './render_error_state'

module AppStates
  class InputAction < Base
    def initialize(app_context)
      super(app_context)
      @menu = Menu.new(app_context)
    end

    def render
      @menu.render
      IOAdapter.write ':) '
    end

    def next
      action_number = 1

      return RenderError.new(AppContext.new(
       valera: @app_context.valera,
       actions_container: @app_context.actions_container,
       prev_data: "Error action number #{action_number}."
      )) unless action_number.is_a? Numeric

      menu_item = @menu.items[action_number.to_i]

      puts "#{menu_item.action} #{menu_item.title}"

      return RenderError.new(AppContext.new(
          valera: @app_context.valera,
          actions_container: @app_context.actions_container,
          prev_data: "Error: does not that action."
      )) if menu_item.nil?

      build_next_state(menu_item.action)
    end

    private

    def build_next_state(action)
      context = AppContext.new(
          valera: app_context.valera,
          actions_container: app_context.actions_container,
          prev_data: action
      )

      if action == :LoadState
        LoadState.new(context)
      elsif action == :SaveState
        SaveState.new(context)
      else
        ApplyAction.new(context)
      end
    end
  end
end
