# frozen_string_literal: true

class Action
  attr_accessor :conds, :effects, :before_text, :after_text

  def initialize(conds: [], effects: [], before_text: '', after_text: '')
    self.before_text = before_text
    self.after_text = after_text
    self.conds = conds
    self.effects = effects
  end

  def valid?(valera)
    conds.map { |c| c.valid?(valera) }
         .inject(true) { |acc, el| acc && el }
  end

  def execute(valera)
    effects.each { |ef| ef.execute(valera) }
  end
end
