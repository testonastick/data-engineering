require 'spec_helper'

describe OrdersController do

  describe "GET 'upload'" do
    it "returns http success" do
      get 'upload'
      expect(response).to be_success
    end
    it "rejects a file without a header" do
      tst_file = fixture_file_upload('/files/no_header_example_input.tab', 'text/plain')
      post :upload, tsv_orders: tst_file
      expect(response).to render_template :cannot_process
    end
    it "creates a merchant and order" do
      tst_file = fixture_file_upload('/files/one_line_example_input.tab', 'text/plain')
      post :upload, tsv_orders: tst_file
      check_merch_name = 'name = "Bob\'s Pizza"'
      check_merchant = Merchant.find(:first, :conditions => [check_merch_name])
      expect(check_merchant).to be_valid
      check_order_name = 'purchaser_name = "Snake Plissken"'
      check_order = Order.find(:first, :conditions => [check_order_name])
      expect(check_order).to be_valid
      expect(response).to render_template :total
    end
    context "with render views" do
      render_views
      it "properly adds and displays total revenue" do
        tst_file = fixture_file_upload('/files/two_line_example_input.tab', 'text/plain')
        post :upload, tsv_orders: tst_file
        expect(response.body).to match /40[.]22/
      end
    end
  end

  describe "GET 'display'" do
    it "returns http success" do
      get 'display'
      expect(response).to be_success
    end
  end

end
