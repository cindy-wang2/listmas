require 'rails_helper'

RSpec.describe "relationships#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/relationships/#{relationship.id}", payload
  end

  describe 'basic update' do
    let!(:relationship) { create(:relationship) }

    let(:payload) do
      {
        data: {
          id: relationship.id.to_s,
          type: 'relationships',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(RelationshipResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { relationship.reload.attributes }
    end
  end
end
