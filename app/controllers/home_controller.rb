class HomeController < ApplicationController
  def index
    if current_user.present?
      @stocks = Stock.where(user_id: current_user)
    end
    if params[:ticker].present?
      @api = FinnhubRuby::DefaultApi.new
      begin
        @present = @api.company_profile2(symbol: params[:ticker])
        @stock = @api.quote(params[:ticker])
        puts @present
        puts "////////////////////////"
        puts @stock
        puts "/////////////////////////"

        if @present.name.blank?
          @error = "Hey! That Stock Symbol Doesn't Exist. Please Try Again."
        end
      rescue FinnhubRuby::ApiError => e
        @error = "API Error: #{e.message}"
      end
    elsif params[:ticker].blank?
      @nothing = "Hey! You Forgot To Enter A Symbol"
      puts @nothing
    end
  end

  def about
  end



end
