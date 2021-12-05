class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string
  attribute :firstname, :string

  # Direct associations

  has_many   :recipients,
             resource: RelationshipResource,
             foreign_key: :your_recipients

  has_many   :gifters,
             resource: RelationshipResource,
             foreign_key: :your_giftgivers

  has_many   :wishlists

  # Indirect associations
end
