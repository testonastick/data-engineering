class OrdersController < ApplicationController
  include OrdersHelper

  def upload
    if ( params[:tsv_orders] != nil ) 
      file = params[:tsv_orders].read
      if ( can_process?(file) )
        upload_time = DateTime.now
        entry_lines = remove_tsv_header(file)
        @total_revenue = 0.00
        entry_lines.each{ |line|
          entry = map_line(line)
          price = BigDecimal.new(entry["item price"])
          count = entry["purchase count"].to_i
          @total_revenue += (price * count)
          order = Order.new :item_description => entry["item description"],
            :item_price => price, 
            :purchase_count => count, 
            :purchaser_name => entry["purchaser name"], 
            :uploaded_at => upload_time
          order.merchant = Merchant.new(:name => entry["merchant name"], 
            :address => entry["merchant address"])
          if ( !order.merchant.valid? ) 
            merch_name = "name = '#{entry['merchant name'].gsub("'","\\'")}'"
            order.merchant = Merchant.find(:first, :conditions => [merch_name])
          end
          order.save
        }
        render :total
      else
        @processing_error = "file #{params[:tsv_orders].original_filename} cannot be processed"
        render :cannot_process
      end

    end
  end

  def display
  end
end
