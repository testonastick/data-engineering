class OrdersController < ApplicationController
  include OrdersHelper

  def upload
    if ( params[:tsv_orders] != nil ) 
      file = params[:tsv_orders].read
      if ( can_process?(file) )
        entry_lines = remove_tsv_header(file)
        entry_line.each{ |line|
          #now we can get them by key
          entry = map_line(line)
        }
        render text: file
      else
        render text: "file #{params[:tsv_orders].original_filename} cannot be processed"
      end

    end
  end

  def display
  end
end
