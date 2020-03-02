class PricesController < ApplicationController
  def index
    prices = Price.all 
    render json: prices
  end

  def show
    price = Price.all.find_by(id: params[:id])
    render json: price 
  end
end
