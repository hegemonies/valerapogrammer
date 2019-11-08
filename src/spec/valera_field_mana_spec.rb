# frozen_string_literal: true

require 'rspec'
require_relative '../../src/ruby/valera'

describe Valera do
  describe '#add_mana' do
    subject { described_class.new(0, 0, 0, 0, 0).add_mana(value) }

    context 'regular add' do
      let(:value) { 50 }
      it { is_expected.to be_a? Valera }
      it { expect(subject.mana).to eq 50 }
    end

    context 'over add' do
      it 'add 110' do
        subject.add_mana(110)
        expect(subject.mana).to eql(100)
      end
    end

    context 'low add' do
      it 'minus 50' do
        subject.add_mana(-50)
        expect(subject.mana).to eql(0)
      end
    end
  end
end
