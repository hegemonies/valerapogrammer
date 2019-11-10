# frozen_string_literal: true

class RenderError < AppStates.Base

  def render
    IOAdapter.writeln @app_context.prev_data
  end

  def next
    build_next_state
  end

  private

  def build_next_state
    InputAction.new(AppContext.new(
        valera: @app_context.valera,
        actions_container: @app_context.actions_container,
        prev_data: nil
    ))
  end

end
