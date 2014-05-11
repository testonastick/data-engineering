require 'spec_helper'

describe Merchant do
  it "is not valid without address" do
    merchant = Merchant.new :address => nil, :name => 'boo'
    expect(merchant).to_not be_valid
  end
  it "is not valid without name" do
    merchant = Merchant.new :address => '1122 boogie boogie ave', :name => nil
    expect(merchant).to_not be_valid
  end
end
