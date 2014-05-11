class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :purchaser_name
      t.text :item_description
      t.decimal :item_price, :precision => 10, :scale => 2
      t.integer :purchase_count
      t.datetime :uploaded_at
      t.references :merchant

      t.timestamps
    end
    add_index :orders, :merchant_id
  end
end
