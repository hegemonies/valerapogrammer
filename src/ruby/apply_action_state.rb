# frozen_string_literal: true

require '../v2/app_states'

class ApplyAction < AppStates.Base

  def render
    @app_context.actions_container.actions.effects.map do
      |ef| IOAdapter.writeln("#{ef.field} #{ef.operator} #{ef.value}")
    end
    @app_context.prev_data.execute @app_context.valera
    IOAdapter.writeln @app_context.prev_data.after_text
  end

  def next
    build_next_state
  end

  private

  def build_next_state
    if @app_context.valera.dead?
      GameOver.new(AppContext.new(
          valera: @app_context.valera,
          actions_container: @app_context.actions_container,
          prev_data: nil
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
