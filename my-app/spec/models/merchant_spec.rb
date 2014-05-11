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
  it "does not store multiple merchants with the same name" do
    merchant1 = Merchant.new :address => '1122 boogie boogie ave', :name => 'boo'
    merchant1.save
    merchant2 = Merchant.new :address => '1132 boogie woogie ave', :name => 'boo'
    merchant2.save
    expect(merchant2).to_not be_valid
  end
end
