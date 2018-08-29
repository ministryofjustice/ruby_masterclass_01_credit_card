class StationFinder

  STATIONS = {
      vic: 'Victoria',
      emb: 'Embankment',
      oxc: 'Oxford Circus'
  }


  def self.name(station_code)
    STATIONS.fetch(station_code)
  end


end
