require 'spec_helper'

describe Order do
  it "is not valid without a merchant" do
    #merchant = Merchant.new :address => '1122 boogie boogie ave', :name => 'booshop'
    order = Order.new
    expect(order).to_not be_valid
  end
end
