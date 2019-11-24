# frozen_string_literal: true

require 'rspec'
require '../ruby/action_container'
require '../ruby/action'
require '../ruby/conds'
require '../ruby/valera'

describe ActionsContainer do
  describe '.available_actions_for' do
    let(:available_action) do
      Action.new
    end
    let(:not_available_action) do
      Action.new(conds: [
          Action::Conds.new(field: :money, operator: :>, value: 50)
      ])
    end
    let(:valera) { Valera.new money: 10 }
    let(:container) { ActionsContainer.new [available_action, not_available_action] }
    subject { container.available_actions_for(valera) }
    it { is_expected.to include available_action }
    it { is_expected.not_to include not_available_action }
  end
end
