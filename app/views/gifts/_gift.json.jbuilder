json.extract! gift, :id, :wishlist_id, :gift_name, :description, :created_at,
              :updated_at
json.url gift_url(gift, format: :json)
