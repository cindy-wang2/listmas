class GiftResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :wishlist, :integer
  attribute :giftname, :string
  attribute :description, :string

  # Direct associations

  belongs_to :list,
             resource: WishlistResource,
             foreign_key: :wishlist

  # Indirect associations

end
