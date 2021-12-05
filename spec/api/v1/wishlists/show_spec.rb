require "rails_helper"

RSpec.describe "wishlists#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/wishlists/#{wishlist.id}", params: params
  end

  describe "basic fetch" do
    let!(:wishlist) { create(:wishlist) }

    it "works" do
      expect(WishlistResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("wishlists")
      expect(d.id).to eq(wishlist.id)
    end
  end
end
