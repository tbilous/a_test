class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.string :name
      t.string :advertiser
      t.decimal :payout, precision:8, scale: 2

      t.timestamps
    end
  end
end
