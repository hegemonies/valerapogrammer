# frozen_string_literal: true

require 'yaml'
require_relative '../../src/ruby/valera'

# ConfigsValera
class ConfigsValera
  def self.load_from_config(filename)
    valera = YAML.load_file(filename)

    ConfigsValera.check_health(valera.health)
    ConfigsValera.check_mana(valera.mana)
    ConfigsValera.check_cheerfulness(valera.cheerfulness)
    ConfigsValera.check_fatigue(valera.fatigue)
    ConfigsValera.check_money(valera.money)
  end

  def self.check_health(health)
    abort 'health < 0' if health.negative?
    abort 'health > 100' if health > 100
  end

  def self.check_mana(mana)
    abort 'mana < 0' if mana.negative?
    abort 'mana > 100' if mana > 100
  end

  def self.check_cheerfulness(cheerfulness)
    abort 'cheerfulness < -10' if cheerfulness < -10
    abort 'cheerfulness > 10' if cheerfulness > 10
  end

  def self.check_fatigue(fatigue)
    abort 'fatigue < 0' if fatigue.negative?
    abort 'fatigue > 100' if fatigue > 100
  end

  def self.check_money(money)
    abort 'money < 0' if money.negative?
  end

  def self.save_to_config(filename, obj)
    File.open(filename, 'w') { |file| file.puts YAML.dump(obj) }
  end
end
