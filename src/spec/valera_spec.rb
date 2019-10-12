require 'rspec'
require_relative '../../src/ruby/valera'

describe Valera do
  describe '#add_fatigue' do
    subject { described_class.new(0, 0) }

    context 'regular add' do
      it 'add 50' do
        subject.add_fatigue 50
        expect(subject.fatigue).to eql(50)
      end
    end

    context 'over add' do
      it 'add 110' do
        subject.add_fatigue 110
        expect(subject.fatigue).to eql(100)
      end
    end

    context 'low add' do
      it 'minus 50' do
        subject.add_fatigue -50
        expect(subject.fatigue).to eql(0)
      end
    end
  end

  describe '#add_fatigue' do
    subject { described_class.new(0, 0) }

    context 'just add' do
      it 'add 50' do
        subject.add_money 50
        expect(subject.money).to eql(50)
      end
    end

    context 'just minus' do
      it 'minus 50' do
        subject.add_money -50
        expect(subject.money).to eql(0)
      end
    end
  end
end
