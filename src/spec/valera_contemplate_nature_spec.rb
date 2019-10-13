# frozen_string_literal: true

require 'rspec'
require_relative '../../src/ruby/valera'

describe Valera do
  describe '#contemplate_nature' do
    subject { described_class.new(50, 40, 5, 0, 5) }

    it 'go' do
      subject.contemplate_nature
      expect(subject.health).to eql(50)
      expect(subject.mana).to eql(30)
      expect(subject.cheerfulness).to eql(6)
      expect(subject.fatigue).to eql(10)
      expect(subject.money).to eql(5)
    end
  end
end
