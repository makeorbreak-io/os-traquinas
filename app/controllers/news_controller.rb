class NewsController < ApplicationController
  include NewsCrawlersHelper
  def index
    render json: btcx()
  end
end
