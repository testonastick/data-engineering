class AddNameIndexToMerchant < ActiveRecord::Migration
  def change
    add_index :merchants, :name
  end
end
