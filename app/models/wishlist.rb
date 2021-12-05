class Wishlist < ApplicationRecord
  # Direct associations

  belongs_to :recipient,
             :class_name => "User",
             :foreign_key => "user"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    recipient.to_s
  end

end
