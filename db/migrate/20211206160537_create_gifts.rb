class CreateGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :gifts do |t|
      t.integer :wishlist_id
      t.string :gift_name
      t.string :description

      t.timestamps
    end
  end
end
