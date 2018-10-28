require 'rails_helper'

describe OysterCard do

  context 'association' do
    it 'retrieves user' do
      user = User.create!(name: 'Boris')
      card = OysterCard.new(user_id: user.id, balance: 30_00)

      expect(card.user.name).to eq 'Boris'
    end
  end
end
