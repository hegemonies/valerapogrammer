# frozen_string_literal: true

require 'rspec'
require_relative '../../src/ruby/valera'

describe Valera do
  describe '#sing_in_subway' do
    context 'not drunk' do
      subject { described_class.new(health = 100, mana = 0, cheerfulness = 0, fatigue = 0, money = 200) }

      it 'sing' do
        subject.sing_in_subway
        expect(subject.health).to eql(100)
        expect(subject.mana).to eql(10)
        expect(subject.cheerfulness).to eql(1)
        expect(subject.fatigue).to eql(20)
        expect(subject.money).to eql(210)
      end
    end

    context 'drunk' do
      subject { described_class.new(health = 100, mana = 50, cheerfulness = 0, fatigue = 0, money = 200) }

      it 'sing' do
        subject.sing_in_subway
        expect(subject.health).to eql(100)
        expect(subject.mana).to eql(60)
        expect(subject.cheerfulness).to eql(1)
        expect(subject.fatigue).to eql(20)
        expect(subject.money).to eql(260)
      end
    end
  end
end
