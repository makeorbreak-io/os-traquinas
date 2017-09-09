module NewsCrawlersHelper
  require 'wombat'

  def btcx
    max = 2
    all_news = []
    for page in 1..max
      news = Wombat.crawl do
        base_url 'https://bt.cx/en/news'
        path "/page/#{page}/"

        news 'xpath=//div[contains(@id, "content")]/article', :iterator do
          title xpath: './header/h2/a'
          img 'xpath=./div[contains(@class, "entry-summary")]/div[contains(@class, "excerpt-thumb")]/a/img/@src'
          url 'xpath=./header/h2/a/@href'
          info 'xpath=./header/h2/a/@href' do |url|
            Wombat.crawl do
              base_url url
              path ''

              body xpath: '//div[contains(@id, "content")]/article/div[contains(@class, "entry-content")]'
              date xpath: '//div[contains(@id, "content")]/article/header/div[contains(@class, "below-title-meta")]/div[contains(@class, "adt")]'
            end
          end
        end
      end
      all_news.push(*news["news"])
    end

    all_news.each do |n|
      News.create(url: n["url"], title: n["title"], date: n["info"]["date"], body: n["info"]["body"], image: n["img"])
    end
  end

  def bitcoin
    max = 10
    all_news = []
    for page in 1..max
      news = Wombat.crawl do
        base_url 'https://news.bitcoin.com'
        path "/page/#{page}/?s"

        news 'xpath=//div[contains(@class, "td-ss-main-content")]/div[contains(@class, "td_module_16 td_module_wrap td-animation-stack")]', :iterator do
          title 'xpath=./div[contains(@class, "item-details")]/h3/a'
          date 'xpath=./div[contains(@class, "item-details")]/div/span'
          img 'xpath=./div[contains(@class, "td-module-thumb")]/a/img/@src'
          url 'xpath=./div[contains(@class, "item-details")]/h3/a/@href'
          info 'xpath=./div[contains(@class, "item-details")]/h3/a/@href' do |url|
            Wombat.crawl do
              base_url url
              path ''

              body 'xpath=//div[contains(@class, "td-post-content")]/p/following-sibling::*', :list
            end
          end
        end
      end
      all_news.push(*news["news"])
    end

    all_news.each do |n|
      News.create(url: n["url"], title: n["title"], date: n["date"], body: n["info"]["body"].join(" "), image: n["img"])
    end
  end

  def cryptocoinsnews
    max = 2
    all_news = []
    for page in 1..max
      news = Wombat.crawl do
        base_url 'https://www.cryptocoinsnews.com/news'
        path "/page/#{page}/"

        news 'xpath=//main[contains(@id, "main")]/div[contains(@id, "post-wrapper")]/div[contains(@class, "grid-wrapper")]/div[contains(@class, "post")]', :iterator do
          title 'xpath=./a/@title'
          url 'xpath=./a/@href'
          img 'xpath=./a/img/@src'
          date 'xpath=./div[contains(@class, "grid-text")]/div[contains(@class, "grid-date")]/spawn[contains(@class, "date")]'
          info 'xpath=./a/@href'do |url|
            Wombat.crawl do
              base_url url
              path ''

              body 'xpath=//main[contains(@id, "main")]/article/div[contains(@class, "entry-content")]/p', :list
            end
          end
        end
      end
      all_news.push(*news["news"])
    end

    all_news.each do |n|
      News.create(url: n["url"], title: n["title"], date: n["date"], body: n["info"]["body"].join(" "), image: n["img"])
    end
  end

end
