require 'rails_helper'

describe Thing do



  describe '#user_details' do
    let(:theresa)     { create :user, name: 'Theresa May' }
    let(:boris)       { create :user, name: 'Boris Johnson' }
    let(:oyster)      { create :oyster_card, user: theresa }
    let(:oyster_zero) { create :oyster_card, :zero_balance, user: boris }


    context 'card has balance' do
      it 'displays name of user' do
        expect(Thing.new(oyster).user_details).to eq 'Theresa May'
      end
    end


    context 'zero balance' do
      it 'displays name of user and warning' do
        expect(Thing.new(oyster_zero).user_details).to eq 'Boris Johnson **** NO TRAVEL (ZERO BALANCE) ****'
      end
    end


    describe '__user_name_or_balance_details' do
      it 'displays name of user and warning' do
        thing = Thing.new(oyster_zero)
        expect(thing.__send__(:user_name_or_deactivation_message)).to eq 'Boris Johnson **** NO TRAVEL (ZERO BALANCE) ****'
      end
    end
  end


  context 'using doubles' do
    let(:user)  { double User, name: 'Stephen Richards' }
    let(:card)  { double OysterCard, user: user }
    let(:thing) { Thing.new(card)}

    it 'returns the user name' do
      expect(card).to receive(:balance).and_return(1234)
      expect(thing.user_details).to eq('Stephen Richards')
    end

    it 'returns no travel message' do
      expect(card).to receive(:balance).and_return(0)
      allow(card).to receive(:id).and_return(66)
      expect(thing.user_details).to eq('Stephen Richards **** NO TRAVEL (ZERO BALANCE) ****')
    end
  end


  context 'using stubs' do
    let(:card)  { OysterCard.new }
    let(:user)  { double User, name: 'Becca'}

    it 'returns the user' do
      allow_any_instance_of(OysterCard).to receive(:user).and_return(user)
      expect(card.user.name).to eq 'Becca'
    end
  end
end
