# frozen_string_literal: true

require './action_container'
require './action'
require './effect'
require './conds'
require 'yaml'

class ConfigLoader
  def initialize(file)
    @file = file
  end

  def load
    ActionsContainer.new(
      YAML.safe_load(File.open(@file)).map { |data| build_action(data) }
    )
  end

  def self.load(file)
    new(file).load
  end

  private

  def build_action(data)
    Action.new after_text: data['after_text'],
               before_text: data['before_text'],
               conds: data['conds'] != nil ? data['conds'].map { |cond| build_cond(cond) } : nil ,
               effects: data['effects'].map { |ef| build_effect(ef) }
  end

  def build_cond(data)
    if data != nil
      Action::Conds.new field: data['field'],
                        operator: data['operator'],
                        value: data['value']
    end
  end

  def build_effect(data)
    Action::Effect.new field: data['field'],
                       operator: data['operator'],
                       value: data['value']
  end
end
