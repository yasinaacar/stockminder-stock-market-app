class HomeController < ApplicationController
  def index
    @api_key = "HXAFHCJ2X137DD3U"

    # @say_hi = "Hİ"
    # @stocks_found = @client.search keywords: "Facebook"
    # @stock = @client.stock symbol: "MSFT"
    # @stock = Alphavantage::Stock.new symbol: "MSFT", key: "HXAFHCJ2X137DD3U"
    # @stock_quote = @stock.quote
    if params[:ticker].present?
      @client = Alphavantage::Client.new key: "HXAFHCJ2X137DD3U"
      @stock = Alphavantage::Stock.new symbol: params[:ticker], key: "HXAFHCJ2X137DD3U"
      @stock_quote = @stock.quote
      puts @stock_quote
    elsif params[:ticker] == ""
      puts  params[:ticker]
      puts "NOTHİNG"
      @nothing = "Lütfen görüntülemek istediğiniz hisse senedinin adını giriniz"
      puts @nothing.present?
    end
  end

  def about
  end



end
