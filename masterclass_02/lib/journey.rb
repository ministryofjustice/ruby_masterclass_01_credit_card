class Journey

  attr_reader :start_station_code, :start_time, :end_station_code, :cost

  def initialize(station_code)
    @start_station_code = station_code
    @start_time = Time.now
  end

  def end_journey(station_code)
    @end_station_code = station_code
    @cost = 2_40
  end
end
