class Thing

  def initialize(card)
    @card = card
  end

  def user_details
    user_name_or_deactivation_message
  end

  private

  def user_name_or_deactivation_message
    if @card.balance == 0
      "#{@card.user.name} **** NO TRAVEL (ZERO BALANCE) ****"
    else
      @card.user.name
    end
  end

end
