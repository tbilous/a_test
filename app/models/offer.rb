class Offer < ApplicationRecord
  validates_presence_of :name, :advertiser
  validates_numericality_of :payout
  validate :validate_currency

  private

  def validate_currency
    errors.add(:payout, 'should be at least 0.01') if payout.nil? || payout < 0.01
  end
end
