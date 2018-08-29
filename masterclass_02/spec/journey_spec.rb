require 'spec_helper'
require_relative '../lib/journey'

describe Journey do
  describe '.new' do
    let(:journey) { Journey.new(:vic) }
    it 'has initialisd start station' do
      expect(journey.start_station_code).to eq :vic
    end

    it 'has set the date' do
      Timecop.freeze(Time.now) do
        journey = Journey.new(:vic)
        expect(journey.start_time).to eq Time.now
      end
    end
  end

  describe '#end_journey' do
    before(:each) do
      @journey = Journey.new(:vic)
      @journey.end_journey(:emb)
    end

    it 'sets the end journey station' do
      expect(@journey.end_station_code).to eq :emb
    end

    it 'sets the cost' do
      expect(@journey.cost).to eq 2_40
    end
  end
end
