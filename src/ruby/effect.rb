# frozen_string_literal: true

class Action
  class Effect
    attr_accessor :field, :operator, :value

    def initialize(field:, operator:, value:)
      self.field = field
      self.operator = operator
      self.value = value
    end

    def execute(valera)
      valera.send("#{field}=", next_value(valera.send(field)))
    end

    private

    def next_value(prev_value)
      prev_value.send(operator, value)
    end
  end
end
