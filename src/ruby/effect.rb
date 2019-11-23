# frozen_string_literal: true

class Action
  class Effect
    attr_accessor :field, :operator, :value

    def initialize(field:, operator:, value:)
      @field = field
      @operator = operator
      @value = value
    end

    def execute(valera)
      eval("valera.#{@field}=valera.#{@field}#{@operator}#{@value}")
    end
  end
end
