# frozen_string_literal: true

class Action
  attr_accessor :conds, :effects, :before_text, :after_text

  def initialize(conds: [], effects: [], before_text: '', after_text: '')
    self.conds = conds
    self.effects = effects
  end

  def valid?(valera)
    conds.map { |c| c.valid?(valera) }
         .inject(true) { |acc, el| acc && el }
  end

  def execute(valera)
    effects.inject(valera) { |v, eff| eff.execute(v) }
  end
end
