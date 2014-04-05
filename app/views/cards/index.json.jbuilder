json.array!(@cards) do |card|
  json.extract! card, :id, :name_jp, :name_en, :card_price_id
  json.url card_url(card, format: :json)
end
