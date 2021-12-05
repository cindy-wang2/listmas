class Wishlist < ApplicationRecord
  # Direct associations

  has_many   :gifts,
             dependent: :destroy

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end
end
