class NewsController < ApplicationController
  include NewsCrawlersHelper
  def index
    news = btcx()
    render json: news, status: :ok
  end
end
