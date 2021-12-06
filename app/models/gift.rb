class Gift < ApplicationRecord
  # Direct associations

  belongs_to :list,
             class_name: "Wishlist",
             foreign_key: "wishlist_id"

  # Indirect associations

  has_one    :recipient,
             through: :list,
             source: :user

  # Validations

  # Scopes

  def to_s
    list.to_s
  end
end
