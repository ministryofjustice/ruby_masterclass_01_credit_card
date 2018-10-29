require 'rails_helper'

describe OysterCardsController, type: :controller do
  describe 'GET index' do
    let(:card1) { double OysterCard }
    let(:card2) { double OysterCard }

    it 'assigns the @cards instance variable' do
      expect(OysterCard).to receive(:order).and_return([card1, card2])
      get :index
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template :index
    end

    context 'http status' do
      it 'returns a 200 http status code' do
        get :index
        expect(response.status).to eq 200
      end

      it 'returns a success status' do
        get :index
        expect(response).to be_success
      end
    end
  end
end
