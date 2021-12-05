require "rails_helper"

RSpec.describe "wishlists#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/wishlists/#{wishlist.id}"
  end

  describe "basic destroy" do
    let!(:wishlist) { create(:wishlist) }

    it "updates the resource" do
      expect(WishlistResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Wishlist.count }.by(-1)
      expect { wishlist.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
