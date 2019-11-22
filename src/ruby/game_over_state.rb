# frozen_string_literal: true

require './app_states'

module AppStates
  class GameOver < Base

    def render
      IOAdapter.writeln 'It is a GAME OVER :('
    end

    def next
      exit
    end

  end
end
