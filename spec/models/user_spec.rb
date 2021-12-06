require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:wishlists) }
  end

  describe "InDirect Associations" do
    it { should have_many(:gifts) }
  end

  describe "Validations" do
    it { should validate_uniqueness_of(:username) }
  end
end
