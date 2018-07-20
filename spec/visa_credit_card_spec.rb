require 'spec_helper'
require_relative '../lib/visa_credit_card.rb'

describe VisaCreditCard do


  describe '.new' do
    it 'instantiates' do
      vcc = VisaCreditCard.new('Stephen Richards', '123434324')
      expect(vcc.balance).to eq 0
    end
  end

  describe '#name' do
    it 'returns the name' do
      vcc = VisaCreditCard.new('Stephen Richards', '123434324')
      expect(vcc.name).to eq 'Stephen Richards'
    end
  end

  describe '.card_type' do
    it 'is a visa' do
      expect(VisaCreditCard.card_type).to eq 'VISA'
    end
  end

  describe '#topup' do
    it 'increases the balance' do
      vcc = VisaCreditCard.new('Stephen Richards', '123434324')
      expect(vcc.balance).to eq 0
      vcc.topup(1_000_00)
      expect(vcc.balance).to eq 1_000_00
    end
  end

  describe '#charge' do

    before do
      @vcc = VisaCreditCard.new('Stephen Richards', '123434324')
      @vcc.topup(1_000_00)
    end

    context 'charge less than balance' do
      it 'adjustst the balance' do
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
