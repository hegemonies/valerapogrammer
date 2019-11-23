# frozen_string_literal: true

require './app_states'

module AppStates
  class GameOver < Base
    def render
      IOAdapter.writeln @app_context.prev_data
    end

    def next
      exit
    end
  end
end
