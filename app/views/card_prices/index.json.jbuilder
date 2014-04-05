json.array!(@card_prices) do |card_price|
  json.extract! card_price, :id, :price, :time
  json.url card_price_url(card_price, format: :json)
end
