require "rails_helper"

RSpec.describe "relationships#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/relationships", params: params
  end

  describe "basic fetch" do
    let!(:relationship1) { create(:relationship) }
    let!(:relationship2) { create(:relationship) }

    it "works" do
      expect(RelationshipResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["relationships"])
      expect(d.map(&:id)).to match_array([relationship1.id, relationship2.id])
    end
  end
end
