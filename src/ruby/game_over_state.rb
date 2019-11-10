# frozen_string_literal: true

require './app_states'

class GameOver < AppStates.Base

  def render
    IOAdapter.writeln 'It is a GAME OVER :('
  end

  def next
    exit
  end

end
