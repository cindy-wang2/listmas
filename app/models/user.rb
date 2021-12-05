class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :recipients,
             class_name: "Relationship",
             foreign_key: "your_recipients",
             dependent: :destroy

  has_many   :gifters,
             class_name: "Relationship",
             foreign_key: "your_giftgivers",
             dependent: :destroy

  has_many   :wishlists,
             dependent: :destroy

  # Indirect associations

  # Validations

  validates :username, uniqueness: true

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
