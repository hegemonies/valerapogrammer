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

    def is_number?(val)
      val.to_f.to_s == val.to_s || val.to_i.to_s == val.to_s
    end

    def next
      action_number = IOAdapter.read

      unless is_number? action_number
        return RenderError.new(AppContext.new(
                                 valera: @app_context.valera,
                                 actions_container: @app_context.actions_container,
                                 prev_data: Colorize.do(Colors::RED, "Error action number #{action_number}.")
                               ))
      end

      menu_item = @menu.items[action_number.to_i]

      puts "#{menu_item.action} #{menu_item.title}"

      if menu_item.nil?
        return RenderError.new(AppContext.new(
                                 valera: @app_context.valera,
                                 actions_container: @app_context.actions_container,
                                 prev_data: 'Error: does not that action.'
                               ))
      end

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
