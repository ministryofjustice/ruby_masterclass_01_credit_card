require 'spec_helper'
require_relative '../lib/oyster_card.rb'

describe OysterCard do


  describe '.new' do
    it 'instantiates' do
      vcc = described_class.new('123434324')
      expect(vcc.balance).to eq 0
    end
  end

  describe '.card_type' do
    it 'is a visa' do
      expect(described_class.card_type).to eq 'OYSTERCARD'
    end
  end

  describe '#topup' do
    it 'increases the balance' do
      vcc = described_class.new('123434324')
      expect(vcc.balance).to eq 0
      vcc.topup(1_000_00)
      expect(vcc.balance).to eq 1_000_00
    end
  end

  describe '#charge' do

    before do
      @vcc = described_class.new('123434324')
      @vcc.topup(1_000_00)
    end

    context 'charge less than balance' do
      it 'adjusts the balance' do
        @vcc.charge(50_00)
        expect(@vcc.balance).to eq (950_00)
      end

      it 'returns true' do
        expect(@vcc.charge(50_00)).to be true
      end
    end

    context 'charge greater than balance' do
      it 'does not change balance' do
        @vcc.charge(1_050_00)
        expect(@vcc.balance).to eq 1_000_00
      end

      it 'returns false' do
        expect(@vcc.charge(1_050_00)).to be false
      end
    end
  end
end
