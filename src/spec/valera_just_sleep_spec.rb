# frozen_string_literal: true

require 'rspec'
require_relative '../../src/ruby/valera'

describe Valera do
  describe '#just_sleep' do
    context 'drunk less than 30' do
      subject { described_class.new(health = 20, mana = 20, cheerfulness = 0, fatigue = 50, money = 200) }

      it 'sleep' do
        subject.just_sleep
        expect(subject.health).to eql(100)
        expect(subject.mana).to eql(0)
        expect(subject.cheerfulness).to eql(0)
        expect(subject.fatigue).to eql(0)
        expect(subject.money).to eql(200)
      end
    end

    context 'drunk over 70' do
      subject { described_class.new(health = 20, mana = 80, cheerfulness = 0, fatigue = 50, money = 200) }

      it 'sleep' do
        subject.just_sleep
        expect(subject.health).to eql(20)
        expect(subject.mana).to eql(30)
        expect(subject.cheerfulness).to eql(-3)
        expect(subject.fatigue).to eql(0)
        expect(subject.money).to eql(200)
      end
    end

    context 'regular drunk' do
      subject { described_class.new(health = 20, mana = 50, cheerfulness = 0, fatigue = 50, money = 200) }

      it 'sleep' do
        subject.just_sleep
        expect(subject.health).to eql(20)
        expect(subject.mana).to eql(0)
        expect(subject.cheerfulness).to eql(0)
        expect(subject.fatigue).to eql(0)
        expect(subject.money).to eql(200)
      end
    end
  end
end
