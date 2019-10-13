# frozen_string_literal: true

require 'rspec'
require_relative '../../src/ruby/valera'

describe Valera do
  describe '#add_money' do
    subject { described_class.new(0, 0, 0, 0, 0) }

    context 'just add' do
      it 'add 50' do
        subject.add_money(50)
        expect(subject.money).to eql(50)
      end
    end

    context 'just minus' do
      it 'minus 50' do
        subject.add_money(-50)
        expect(subject.money).to eql(0)
      end
    end
  end
end
