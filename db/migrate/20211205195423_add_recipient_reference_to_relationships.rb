class AddRecipientReferenceToRelationships < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :relationships, :users, column: :your_giftgivers
    add_index :relationships, :your_giftgivers
    change_column_null :relationships, :your_giftgivers, false
  end
end
