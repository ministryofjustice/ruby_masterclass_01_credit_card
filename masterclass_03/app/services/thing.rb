class Thing

  def initialize(card)
    @card = card
  end

  def user_id
    user_name_or_deactivation_message
  end

  private

  def user_name_or_deactivation_message
    if @card == 0
      'No balance on card'
    else
      @card.user.id
    end
  end

end
