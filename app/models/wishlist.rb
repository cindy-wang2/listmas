class Wishlist < ApplicationRecord
  # Direct associations

  has_many   :gifts,
             :dependent => :destroy

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
