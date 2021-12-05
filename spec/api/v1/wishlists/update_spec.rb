require "rails_helper"

RSpec.describe "wishlists#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/wishlists/#{wishlist.id}", payload
  end

  describe "basic update" do
    let!(:wishlist) { create(:wishlist) }

    let(:payload) do
      {
        data: {
          id: wishlist.id.to_s,
          type: "wishlists",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(WishlistResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { wishlist.reload.attributes }
    end
  end
end
