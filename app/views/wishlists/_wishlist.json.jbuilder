json.extract! wishlist, :id, :user_id, :recipient, :wishlist_name, :created_at,
              :updated_at
json.url wishlist_url(wishlist, format: :json)
