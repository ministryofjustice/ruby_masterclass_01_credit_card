require 'spec_helper'
require_relative '../lib/oyster_card.rb'

describe OysterCard do

  let(:oyster) { described_class.new('123434324') }

  describe '.new' do
    it 'instantiates' do
      expect(oyster.balance).to eq 0
    end
  end

  describe '.card_type' do
    it 'is a visa' do
      expect(described_class.card_type).to eq 'OYSTERCARD'
    end
  end

  describe '#topup' do
    it 'increases the balance' do
      expect(oyster.balance).to eq 0
      oyster.topup(1_000_00)
      expect(oyster.balance).to eq 1_000_00
    end
  end

  describe '#charge' do

    before do
      @oyster = described_class.new('123434324')
      @oyster.topup(1_000_00)
    end

    context 'charge less than balance' do
      it 'adjusts the balance' do
        @oyster.charge(50_00)
        expect(@oyster.balance).to eq (950_00)
      end

      it 'returns true' do
        expect(@oyster.charge(50_00)).to be true
      end
    end

    context 'charge greater than balance' do
      it 'does not change balance' do
        @oyster.charge(1_050_00)
        expect(@oyster.balance).to eq 1_000_00
      end

      it 'returns false' do
        expect(@oyster.charge(1_050_00)).to be false
      end
    end
  end
end
