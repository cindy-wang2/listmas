class Gift < ApplicationRecord
  # Direct associations

  belongs_to :list,
             class_name: "Wishlist",
             foreign_key: "wishlist_id",
             counter_cache: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    gift_name
  end
end
