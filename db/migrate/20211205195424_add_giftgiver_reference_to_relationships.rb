class AddGiftgiverReferenceToRelationships < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :relationships, :users, column: :your_recipients
    add_index :relationships, :your_recipients
    change_column_null :relationships, :your_recipients, false
  end
end
