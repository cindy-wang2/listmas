class Gift < ApplicationRecord
  # Direct associations

  belongs_to :list,
             :class_name => "Wishlist",
             :foreign_key => "wishlist"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    list.to_s
  end

end
