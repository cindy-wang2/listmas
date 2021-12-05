json.extract! gift, :id, :wishlist, :giftname, :description, :created_at,
              :updated_at
json.url gift_url(gift, format: :json)
