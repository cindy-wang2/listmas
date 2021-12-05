class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string
  attribute :firstname, :string

  # Direct associations

  has_many :wishlists

  # Indirect associations

  has_many :gifts do
    assign_each do |user, gifts|
      gifts.select do |g|
        g.id.in?(user.gifts.map(&:id))
      end
    end
  end
end
