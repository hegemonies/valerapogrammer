# frozen_string_literal: true

require 'rspec'
require_relative '../../src/ruby/valera'

describe Valera do
  describe '#go_to_work1' do
    subject { described_class.new(50, 40, 5, 0, 5) }

    it 'go' do
      subject.go_to_work
      expect(subject.health).to eql(50)
      expect(subject.mana).to eql(10)
      expect(subject.cheerfulness).to eql(-5)
      expect(subject.fatigue).to eql(70)
      expect(subject.money).to eql(105)
    end
  end

  describe '#go_to_work2' do
    subject { described_class.new(50, 60, 5, 0, 5) }

    it 'go' do
      subject.go_to_work
      expect(subject.health).to eql(50)
      expect(subject.mana).to eql(60)
      expect(subject.cheerfulness).to eql(5)
      expect(subject.fatigue).to eql(0)
      expect(subject.money).to eql(5)
    end
  end

  describe '#go_to_work3' do
    subject { described_class.new(50, 40, 5, 80, 5) }

    it 'go' do
      subject.go_to_work
      expect(subject.health).to eql(50)
      expect(subject.mana).to eql(40)
      expect(subject.cheerfulness).to eql(5)
      expect(subject.fatigue).to eql(80)
      expect(subject.money).to eql(5)
    end
  end
end
