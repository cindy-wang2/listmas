class CreateWishlists < ActiveRecord::Migration[6.0]
  def change
    create_table :wishlists do |t|
      t.integer :user_id
      t.string :owner

      t.timestamps
    end
  end
end