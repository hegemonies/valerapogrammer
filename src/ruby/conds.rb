# frozen_string_literal: true

class Action
  class Conds
    attr_accessor :field, :operator, :value

    def initialize(field:, operator:, value:)
      self.field = field
      self.operator = operator
      self.value = value
    end

    def valid?(valera)
      actual_value = valera.send field
      actual_value.send operator, value
    end
  end
end
