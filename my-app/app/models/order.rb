class Order < ActiveRecord::Base
  belongs_to :merchant
  attr_accessible :item_description, :item_price, :purchase_count, :purchaser_name, :uploaded_at
  validates :merchant, presence: true
end
