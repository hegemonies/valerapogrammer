# frozen_string_literal: true

# Simulate Valera's action
class SimulateAction
  def self.do
    Random.rand(5).times do
      print '.'
      sleep(1)
    end
    puts
  end
end
