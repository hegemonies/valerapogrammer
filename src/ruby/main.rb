# frozen_string_literal: true

require './game'

begin
  game = Game.new
  # todo: load settings
  run_game = true
  while run_game
    run_game = game.next_step
  end
end
