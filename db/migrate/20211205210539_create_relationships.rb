class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.integer :your_giftgivers
      t.integer :your_recipients
      t.string :relationshiptype

      t.timestamps
    end
  end
end
