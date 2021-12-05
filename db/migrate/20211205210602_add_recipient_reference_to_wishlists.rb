class AddRecipientReferenceToWishlists < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :wishlists, :users
    add_index :wishlists, :user
    change_column_null :wishlists, :user, false
  end
end
