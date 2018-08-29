require 'journey'

class OysterCard

  attr_reader :balance, :journeys

  def initialize(name, card_number)
    @name = name
    @card_number = card_number
    @balance = 0
    @journeys = []
  end


  def topup(amount)
    @balance += amount
  end

  def charge(amount)
    if enough_balance?(amount)
      decrement_balance(amount)
    else
      false
    end
  end

  def swipe_in(station_code)
    @journeys << Journey.new(station_code)
  end

  def swipe_out(station_code)
    @journeys.last.end_journey(station_code)
    decrement_balance(@journeys.last.cost)
  end



  private

  def enough_balance?(amount)
    @balance >= amount
  end

  def decrement_balance(amount)
    @balance -= amount
    true
  end



end
