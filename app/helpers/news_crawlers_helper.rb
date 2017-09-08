module NewsCrawlersHelper
  require 'wombat'

  def btcx
    Wombat.crawl do
      base_url 'https://bt.cx/en/news'
      path '/'

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
  end
end
