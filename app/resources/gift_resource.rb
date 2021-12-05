class GiftResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :wishlist_id, :integer
  attribute :giftname, :string
  attribute :description, :string

  # Direct associations

  belongs_to :list,
             resource: WishlistResource,
             foreign_key: :wishlist_id

  # Indirect associations

  has_one    :recipient,
             resource: UserResource

  filter :user_id, :integer do
    eq do |scope, value|
      scope.eager_load(:recipient).where(wishlists: { user_id: value })
    end
  end
end
