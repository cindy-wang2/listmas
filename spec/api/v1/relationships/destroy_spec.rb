require 'rails_helper'

RSpec.describe "relationships#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/relationships/#{relationship.id}"
  end

  describe 'basic destroy' do
    let!(:relationship) { create(:relationship) }

    it 'updates the resource' do
      expect(RelationshipResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Relationship.count }.by(-1)
      expect { relationship.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
