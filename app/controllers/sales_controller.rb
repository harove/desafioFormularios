#require 'pry-byebug'
class SalesController < ApplicationController
  def new
  end

  def create
    sale = Sale.new
    sale.detail = params[:sale][:sale_detail]
    sale.category = params[:sale][:sale_category]
    sale.value = params[:sale][:sale_value]
    sale.discount = params[:sale][:sale_discount]

    if params[:sale][:sale_tax] != "1"
      sale.value = sale.value*1.19
      sale.tax = 19
    end

    if sale.save
      redirect_to sales_done_path
    end
  end

  def done
    @last_sale= Sale.last
  end  
end
