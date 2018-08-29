require 'spec_helper'
require_relative '../lib/station_finder.rb'

describe StationFinder do
  describe '#name' do
    it 'returns the name of the sation if exists' do
      expect(StationFinder.name(:vic)).to eq 'Victoria'
    end

    it 'raises if station code doesnt exist' do
      expect do
        StationFinder.name(:xxx)
      end.to raise_error KeyError, 'key not found: :xxx'
    end
  end
end
