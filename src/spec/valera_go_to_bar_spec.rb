# frozen_string_literal: true

require 'rspec'
require_relative '../../src/ruby/valera'

describe Valera do
  describe '#go_to_bar' do
    subject { described_class.new(health = 100, mana=0, cheerfulness=0, fatigue=0, money=200) }

    it 'go' do
      subject.go_to_bar
      expect(subject.health).to eql(90)
      expect(subject.mana).to eql(60)
      expect(subject.cheerfulness).to eql(1)
      expect(subject.fatigue).to eql(40)
      expect(subject.money).to eql(100)
    end
  end
end
