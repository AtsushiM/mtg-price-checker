require "#{Rails.root}/app/models/card"

class UpdateCardPrices
  @cards = Card.all
  @cards.each do |card|
    puts card.name_jp
  end
end
