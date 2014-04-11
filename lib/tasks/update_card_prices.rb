require "#{Rails.root}/app/models/card"
require "open-uri"
require "nokogiri"

# ./bin/rails runner lib/tasks/update_card_prices.rb

class UpdateCardPrices
  @cards = Card.all
  @cards.each do |card|
    # puts card.name_jp
    # http://wonder.wisdom-guild.net/price/Liliana+of+the+Veil/
    # 英名、スペースは+に変換

    url = card.name_en.gsub(/\s/, '+')
    url = 'http://wonder.wisdom-guild.net/price/' + url + '/'

    charset = nil
    html = open(url) do |f|
      charset = f.charset # 文字種別を取得
      f.read # htmlを読み込んで変数htmlに渡す
    end

    # htmlをパース(解析)してオブジェクトを生成
    doc = Nokogiri::HTML.parse(html, nil, charset)

    # タイトルを表示
    now_price = doc.css('.price-summary big b').text.gsub(',', '').to_i

    hoge = card.card_prices.new(:price => now_price)
    hoge.save
  end
end
