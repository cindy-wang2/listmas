class Relationship < ApplicationRecord
  # Direct associations

  belongs_to :giftgiver,
             :class_name => "User",
             :foreign_key => "your_recipients"

  belongs_to :recipient,
             :class_name => "User",
             :foreign_key => "your_giftgivers"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    recipient.to_s
  end

end
