require 'rails_helper'

RSpec.describe Wishlist, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:gifts) }

    it { should belong_to(:recipient) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
