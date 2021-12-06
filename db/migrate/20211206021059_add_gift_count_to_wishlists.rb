class AddGiftCountToWishlists < ActiveRecord::Migration[6.0]
  def change
    add_column :wishlists, :gifts_count, :integer
  end
end
