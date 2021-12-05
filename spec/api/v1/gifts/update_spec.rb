require 'rails_helper'

RSpec.describe "gifts#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/gifts/#{gift.id}", payload
  end

  describe 'basic update' do
    let!(:gift) { create(:gift) }

    let(:payload) do
      {
        data: {
          id: gift.id.to_s,
          type: 'gifts',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(GiftResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { gift.reload.attributes }
    end
  end
end
