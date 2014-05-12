require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the OrdersHelper. For example:
#
# describe OrdersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe OrdersHelper do
  describe "remove_tsv_header" do
    it "removes header from the tsv string" do
      @good_tst = <<-END.gsub(/^ */,'')
       purchaser name\titem description\titem price\tpurchase count\tmerchant address\tmerchant name
       foo bar\tlots o $1 bills\t100.00\t2\t1122 bb ave\tboo's scare shop
       baz\tnice $2 bill\t3.00\t1\t4 Eleventh St. NE\tblizzard mall
      END
      @expected = [
       "foo bar\tlots o $1 bills\t100.00\t2\t1122 bb ave\tboo's scare shop",
       "baz\tnice $2 bill\t3.00\t1\t4 Eleventh St. NE\tblizzard mall"
      ]

      expect(helper.remove_tsv_header(@good_tst)).to eq(@expected)
    end
  end
  describe "map_line" do
    it "returns the split line in a map with the origial headings as keys" do
       line = "foo bar\tlots o $1 bills\t100.00\t2\t1122 bb ave\tboo's scare shop"
       expected = {
         "purchaser name" => "foo bar",
         "item description" => "lots o $1 bills",
         "item price" => "100.00",
         "purchase count" => "2",
         "merchant address" => "1122 bb ave",
         "merchant name" => "boo's scare shop"
       }
       expect(helper.map_line(line)).to eq(expected)

    end
  end
  describe "can_process?" do
    it "returns false if there is no header" do
      @bad_no_hdr_tst = <<-END.gsub(/^ */,'')
       foo bar\tlots o $1 bills\t100.00\t2\t1122 bb ave\tboo's scare shop
       baz\tnice $2 bill\t3.00\t1\t4 Eleventh St. NE\tblizzard mall
      END

      expect(helper.can_process?(@bad_no_hdr_tst)).to be(false)
    end
    it "returns false if there is a header in a different order" do
      @bad_tst = <<-END.gsub(/^ */,'')
       purchaser_name\titem_description\titem_price\tpurchase_count\tmerchant_address\tmerchant_name
       foo bar\tlots o $1 bills\t100.00\t2\t1122 bb ave\tboo's scare shop
       baz\tnice $2 bill\t3.00\t1\t4 Eleventh St. NE\tblizzard mall
      END

      expect(helper.can_process?(@bad_tst)).to be(false)
    end
    it "returns false if there is a header even in right order with different delimiters" do
      @bad_comma_tst = <<-END.gsub(/^ */,'')
       purchaser name,item description,item price,purchase count,merchant address,merchant name
       foo bar,lots o $1 bills,100.00,2,1122 bb ave,boo's scare shop
       baz,nice $2 bill,3.00,1,4 Eleventh St. NE,blizzard mall
      END
      
      expect(helper.can_process?(@bad_comma_tst)).to be(false)
    end
    it "returns true if there is a header line and it's in the right order" do
      @good_tst = <<-END.gsub(/^ */,'')
       purchaser name\titem description\titem price\tpurchase count\tmerchant address\tmerchant name
       foo bar\tlots o $1 bills\t100.00\t2\t1122 bb ave\tboo's scare shop
       baz\tnice $2 bill\t3.00\t1\t4 Eleventh St. NE\tblizzard mall
      END

      expect(helper.can_process?(@good_tst)).to be(true)
    end
  end
end
