require 'rails_helper'

RSpec.describe "relationships#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/relationships/#{relationship.id}", params: params
  end

  describe 'basic fetch' do
    let!(:relationship) { create(:relationship) }

    it 'works' do
      expect(RelationshipResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('relationships')
      expect(d.id).to eq(relationship.id)
    end
  end
end
