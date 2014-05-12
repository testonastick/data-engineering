require 'spec_helper'

describe OrdersController do

  describe "GET 'upload'" do
    it "returns http success" do
      get 'upload'
      expect(response).to be_success
    end
  end

  describe "GET 'display'" do
    it "returns http success" do
      get 'display'
      expect(response).to be_success
    end
  end

end
