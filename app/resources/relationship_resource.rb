class RelationshipResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :your_giftgivers, :integer
  attribute :your_recipients, :integer
  attribute :relationshiptype, :string

  # Direct associations

  # Indirect associations

end
