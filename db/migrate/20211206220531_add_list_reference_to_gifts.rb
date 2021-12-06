class AddListReferenceToGifts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :gifts, :wishlists
    add_index :gifts, :wishlist_id
    change_column_null :gifts, :wishlist_id, false
  end
end
