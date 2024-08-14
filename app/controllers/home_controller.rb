class HomeController < ApplicationController
  def index
    if current_user.present?
      @stocks = Stock.where(user_id: current_user)
    end
    if params[:ticker].present?
      @api = FinnhubRuby::DefaultApi.new
      begin
        @present = @api.company_profile2(symbol: params[:ticker])
        unless @present.name.present?
          @error = "Böyle bir hisse senendi bulunamadı"
        else
          @stock = @api.quote(params[:ticker])
        end
        puts @present.name.present?


      rescue FinnhubRuby::ApiError => e
        @error = "API Error: #{e.message}"
      end

    end
  end

  def about
  end



end
