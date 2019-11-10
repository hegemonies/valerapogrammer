# frozen_string_literal: true

require './v2/io_adapter'
require './colorize'
require './colors_enum'
require 'yaml'
require './valera'

begin
  # Game.new.default.start
  # Application.run
  settings_filename = "resources/settings.yaml"
  valera = Valera.new(health: 100, mana: 2, cheerfulness: 3, money: 4, fatigue: 3)
  File.open(settings_filename, "w") { |file| file.write(valera.to_yaml) }

  valera2 = YAML.load(File.read(settings_filename))
  puts valera2.health
  puts valera2.mana
  puts valera2.cheerfulness
  puts valera2.fatigue
  puts valera2.money
end
