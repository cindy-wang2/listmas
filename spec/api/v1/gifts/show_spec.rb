require "rails_helper"

RSpec.describe "gifts#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/gifts/#{gift.id}", params: params
  end

  describe "basic fetch" do
    let!(:gift) { create(:gift) }

    it "works" do
      expect(GiftResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("gifts")
      expect(d.id).to eq(gift.id)
    end
  end
end
