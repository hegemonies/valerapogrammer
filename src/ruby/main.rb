# frozen_string_literal: true

require './game'
require './valera_builder'

# begin
#   game = Game.new
#   # todo: load settings
#   run_game = true
#   while run_game
#     run_game = game.next_step
#   end
# end

# begin
#   valera = ValeraBuilder.build do |builder|
#     builder.set_health(90)
#     builder.set_cheerfulness(3)
#     builder.set_mana(50)
#     builder.set_fatigue(70)
#   end
#
#   puts valera.health
#   puts valera.mana
# end

begin
  Game.new.start
end
