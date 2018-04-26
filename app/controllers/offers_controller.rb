class OffersController < ApplicationController
  include Serialized

  before_action :load_offer, only: %i(edit update)

  respond_to :json, only: %i(create update edit)

  def index
    @offers = Offer.order(created_at: :desc)
  end

  def create
    @offer = Offer.create(strong_params)
    publish_broadcast @offer
  end

  def edit
    @offer = Offer.find(params[:id])
    render json: helpers
      .c("#{controller_name}_offer-form",
         offer: @offer, id: "edit_offer#{@offer.id}", m: 'PATCH', tclass: 'js-form-edit')
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(strong_params)
    publish_broadcast @offer
  end

  private

  def load_offer
    @offer = Offer.find(params[:id])
  end

  def strong_params
    params.require(:offer).permit(:name, :advertiser, :payout)
  end
end
