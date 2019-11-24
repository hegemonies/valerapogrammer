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
    if @conds != nil
      @conds.map { |c| c != nil ? c.valid?(valera) : true }
          .inject(true) { |acc, el| acc && el }
    else
      true
    end
  end

  def execute(valera)
    effects.each { |ef| ef.execute(valera) }
  end
end
