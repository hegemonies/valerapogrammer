# frozen_string_literal: true

require 'rspec'
require_relative '../../src/ruby/valera'

describe Valera do
  describe '#add_cheerfulness' do
    subject { described_class.new(0, 0, 0, 0, 0) }

    context 'regular add' do
      it 'add 5' do
        subject.add_cheerfulness(5)
        expect(subject.cheerfulness).to eql(5)
      end
    end

    context 'over add' do
      it 'add 110' do
        subject.add_cheerfulness(110)
        expect(subject.cheerfulness).to eql(10)
      end
    end

    context 'low add' do
      it 'minus 50' do
        subject.add_cheerfulness(-50)
        expect(subject.cheerfulness).to eql(-10)
      end
    end
  end
end
