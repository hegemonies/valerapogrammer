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
      # valera.send("#{field}=", next_value(valera.send(field)))
      valera.send("#{field}=", eval("#{String.const_get("valera.#{field}")} #{operator} #{value}"))
      # valera.send("#{field}=", valera.send("#{field}", "#{operator} #{value}"))
    end

    private

    def next_value(prev_value)
      prev_value.send(operator, value)
    end
  end
end
