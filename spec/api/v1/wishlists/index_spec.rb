require 'rails_helper'

RSpec.describe "wishlists#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/wishlists", params: params
  end

  describe 'basic fetch' do
    let!(:wishlist1) { create(:wishlist) }
    let!(:wishlist2) { create(:wishlist) }

    it 'works' do
      expect(WishlistResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['wishlists'])
      expect(d.map(&:id)).to match_array([wishlist1.id, wishlist2.id])
    end
  end
end
