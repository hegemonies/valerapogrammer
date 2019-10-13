# frozen_string_literal: true

require 'rspec'
require_relative '../../src/ruby/valera'

describe Valera do
  describe '#drink_with_marginals' do
    subject { described_class.new(health=100, mana=0, cheerfulness=0, fatigue=0, money=200) }

    it 'just drink' do
      subject.drink_with_marginals
      expect(subject.health).to eql(20)
      expect(subject.mana).to eql(90)
      expect(subject.cheerfulness).to eql(5)
      expect(subject.fatigue).to eql(80)
      expect(subject.money).to eql(50)
    end
  end
end

