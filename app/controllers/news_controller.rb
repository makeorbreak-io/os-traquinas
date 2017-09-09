class NewsController < ApplicationController
  include NewsCrawlersHelper
  def index
    news = News.all
    render json: news.order(:date), status: :ok
  end


  def run_crawlers
    btcx()
    bitcoin()
    cryptocoinsnews()
  end
end
