class AddUserReferenceToWishlists < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :wishlists, :users
    add_index :wishlists, :user_id
    change_column_null :wishlists, :user_id, false
  end
end
