require 'rails_helper'

RSpec.describe Offer, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :advertiser }
  it { should validate_numericality_of(:payout) }

  let(:offer) { build(:offer) }

  it 'validate currency payout' do
    offer.payout = 0.001
    expect(offer).to_not be_valid
    expect(offer.errors.messages[:payout]).to eq ['should be at least 0.01']
  end
end
