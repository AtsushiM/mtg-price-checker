class CreateCardPrices < ActiveRecord::Migration
  def change
    create_table :card_prices do |t|
      t.integer :price ,:default => 0
      t.timestamp :time
      t.references :card, index: true

      t.timestamps
    end
  end
end
