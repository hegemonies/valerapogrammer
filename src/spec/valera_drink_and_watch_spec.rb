# frozen_string_literal: true

require 'rspec'
require_relative '../../src/ruby/valera'

describe Valera do
  describe '#drink_and_watch' do
    subject { described_class.new(50, 40, 5, 0, 25) }

    it 'go' do
      subject.drink_and_watch
      expect(subject.health).to eql(45)
      expect(subject.mana).to eql(70)
      expect(subject.cheerfulness).to eql(4)
      expect(subject.fatigue).to eql(10)
      expect(subject.money).to eql(5)
    end
  end
end
