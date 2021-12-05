require 'rails_helper'

RSpec.describe "wishlists#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/wishlists", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'wishlists',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(WishlistResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Wishlist.count }.by(1)
    end
  end
end
