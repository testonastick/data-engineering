class Merchant < ActiveRecord::Base
  attr_accessible :address, :name
  validates :address, presence: true
  validates :name, presence: true
end
