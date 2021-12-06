class GiftResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :wishlist_id, :integer
  attribute :gift_name, :string
  attribute :description, :string

  # Direct associations

  belongs_to :list,
             resource: WishlistResource,
             foreign_key: :wishlist_id

  # Indirect associations
end
