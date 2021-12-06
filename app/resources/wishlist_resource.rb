class WishlistResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :recipient, :string
  attribute :wishlist_name, :string

  # Direct associations

  has_many   :gifts

  belongs_to :user

  # Indirect associations
end
