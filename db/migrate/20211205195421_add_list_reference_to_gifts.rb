class AddListReferenceToGifts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :gifts, :wishlists
    add_index :gifts, :wishlist
    change_column_null :gifts, :wishlist, false
  end
end
