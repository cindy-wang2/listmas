class WishlistResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user, :integer

  # Direct associations

  has_many   :gifts

  belongs_to :recipient,
             resource: UserResource,
             foreign_key: :user

  # Indirect associations
end
