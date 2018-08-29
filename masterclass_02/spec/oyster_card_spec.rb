require 'spec_helper'
require_relative '../lib/oyster_card.rb'

describe OysterCard do

  let(:oyster)  { oyster = OysterCard.new('stephen', 12345) }

  describe '#balance' do
    it 'has an initial balance of zero' do
      expect(oyster.balance).to eq 0
    end
  end

  describe '#topup' do
    it 'increments the balance' do
      oyster.topup(55_72)
      expect(oyster.balance).to eq 55_72
    end

    it 'handles multiple topups' do
      oyster.topup(55_72)
      oyster.topup(100_00)
      expect(oyster.balance).to eq 155_72
    end
  end

  describe '#charge' do
    context 'not enough money on card' do
      it 'returns false' do
        expect(oyster.charge(5_00)).to be false
      end

      it 'does not change the balance' do
        expect(oyster.balance).to eq 0
        oyster.charge(5_00)
        expect(oyster.balance).to eq 0
      end
    end

    context 'enough money on card' do
      it 'returns true' do
        oyster.topup(100_00)
        expect(oyster.charge(5_00)).to be true
      end

      it 'changes the balance' do
        expect(oyster.balance).to eq 0
        oyster.topup(100_00)
        oyster.charge(5_00)
        expect(oyster.balance).to eq 95_00
      end
    end
  end


  describe '#swipe_in' do
    before(:each) do
      oyster.swipe_in(:vic)
    end
    it 'records the journey' do
      expect(oyster.journeys.size).to eq 1
    end
  end

  describe '#swipe_out' do
    before(:each) do
      oyster.topup(10_00)
      oyster.swipe_in(:vic)
      oyster.swipe_out(:emb)
    end

    it 'reduces the balance' do
      expect(oyster.balance).to eq 7_60
    end
  end

end
