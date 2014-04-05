class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name_jp
      t.string :name_en
      t.integer :purchase_price

      t.timestamps
    end
  end
end
