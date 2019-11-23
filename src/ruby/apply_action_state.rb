# frozen_string_literal: true

require './app_states'
require './game_over_state'

module AppStates
  class ApplyAction < Base
    def render
      @app_context.prev_data.effects.each do |ef|
        IOAdapter.write("#{ef.field}#{ef.operator}#{ef.value} ")
      end
      @app_context.prev_data.execute @app_context.valera
      IOAdapter.writeln @app_context.prev_data.after_text
    end

    def next
      build_next_state
    end

    private

    def build_next_state
      if @app_context.valera.died?
        GameOver.new(AppContext.new(
                       valera: @app_context.valera,
                       actions_container: @app_context.actions_container,
                       prev_data: 'Valera is dead :('
                     ))
      else
        InputAction.new(AppContext.new(
                          valera: @app_context.valera,
                          actions_container: @app_context.actions_container,
                          prev_data: nil
                        ))
      end
    end
  end
end
