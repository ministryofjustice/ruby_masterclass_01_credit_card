class OysterCardsController < ApplicationController
  def index
    @cards = OysterCard.order(balance: :desc)
  end

  def show
  end
end
