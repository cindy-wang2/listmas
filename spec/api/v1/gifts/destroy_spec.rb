require "rails_helper"

RSpec.describe "gifts#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/gifts/#{gift.id}"
  end

  describe "basic destroy" do
    let!(:gift) { create(:gift) }

    it "updates the resource" do
      expect(GiftResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Gift.count }.by(-1)
      expect { gift.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
