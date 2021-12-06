class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :wishlists,
             dependent: :destroy

  # Indirect associations

  has_many   :gifts,
             through: :wishlists,
             source: :gifts

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
