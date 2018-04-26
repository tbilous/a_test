require 'rails_helper'

RSpec.describe OffersController, type: :controller do
  describe 'GET #index' do
    let!(:offers) { create_list(:offer, 2) }
    subject { get :index }

    before { subject }

    it 'response success' do
      expect(response).to have_http_status(:success)
    end

    it 'assign offers' do
      expect(assigns(:offers)).to match_array(offers)
    end
  end

  describe 'POST #create' do
    let(:form_params) { {} }
    let(:params) do
      {
        offer: attributes_for(:offer).merge(form_params), format: :json
      }
    end

    subject { post :create, params: params }

    it { expect { subject }.to change(Offer, :count).by(1) }

    it_behaves_like 'invalid params', 'empty name', model: Offer do
      let(:form_params) { { name: '' } }
    end
    it_behaves_like 'invalid params', 'empty advertiser', model: Offer do
      let(:form_params) { { advertiser: '' } }
    end
    it_behaves_like 'invalid params', 'empty title', model: Offer do
      let(:form_params) { { payout: '' } }
    end
    it_behaves_like 'invalid params', 'empty payout', model: Offer do
      let(:form_params) { { payout: 'z' } }
    end
  end

  describe 'GET #edit' do
    let!(:offer) { create(:offer) }

    let(:params) do
      {
        id: offer.id, format: :json
      }
    end
    subject { get :edit, params: params }
    before { subject }

    it 'response success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH #update' do
    let!(:offer) { create(:offer) }
    let(:form_params) do
      {
        name: 'b' * 6,
        advertiser: 'z' * 6,
        payout: 0.11
      }
    end

    let(:params) do
      {
        id: offer.id,
        format: :json,
        offer: attributes_for(:offer).merge(form_params)
      }
    end

    subject do
      patch :update, params: params
      offer.reload
    end

    before { subject }

    it { expect(offer.name).to eql params[:offer][:name] }
    it { expect(offer.advertiser).to eql params[:offer][:advertiser] }
    it { expect(offer.payout).to eql params[:offer][:payout] }

    it_behaves_like 'invalid params js', 'empty name', model: Offer do
      let(:form_params) { { name: '' } }
    end
    it_behaves_like 'invalid params js', 'empty advertiser', model: Offer do
      let(:form_params) { { advertiser: '' } }
    end
    it_behaves_like 'invalid params js', 'empty title', model: Offer do
      let(:form_params) { { payout: '' } }
    end
    it_behaves_like 'invalid params js', 'empty payout', model: Offer do
      let(:form_params) { { payout: 'z' } }
    end
  end
end
