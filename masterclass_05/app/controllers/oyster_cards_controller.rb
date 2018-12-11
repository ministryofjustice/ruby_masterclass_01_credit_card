class OysterCardsController < ApplicationController
  def index
    @cards = OysterCard.order(balance: :desc)
  end

  def show
  end


  def swipe_out
    @card = OysteCard.find(params[:id])
    authorize @card # uses a Pundit policy to determine whether or not the current user is authorised to update this card
    @journey_end_station = Station.find(params[:swipe_out][journey_end_station_id])
    if @card.journey_start_station.nil?
      flash[:alert] << "No start of journey recorded - you have been charged the maximum fare"
      @card.balance -= MAXIMUM_FARE
    else
      # work out fare
      zones_travelled = [@card.start_journey_station.zone, journey_end_station.zone].sort
      fare = FARES[zones_travelled]
      @card.balance -= fare
    end

    if @card.balance < 0
      flash[:alert] << 'You have no balance on your card - you must top up before travelling again'
    end
  end
end
