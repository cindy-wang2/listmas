require 'rails_helper'

RSpec.describe "gifts#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/gifts", params: params
  end

  describe 'basic fetch' do
    let!(:gift1) { create(:gift) }
    let!(:gift2) { create(:gift) }

    it 'works' do
      expect(GiftResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['gifts'])
      expect(d.map(&:id)).to match_array([gift1.id, gift2.id])
    end
  end
end
