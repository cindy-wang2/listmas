require 'rails_helper'

RSpec.describe GiftResource, type: :resource do
  describe 'serialization' do
    let!(:gift) { create(:gift) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(gift.id)
      expect(data.jsonapi_type).to eq('gifts')
    end
  end

  describe 'filtering' do
    let!(:gift1) { create(:gift) }
    let!(:gift2) { create(:gift) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: gift2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([gift2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:gift1) { create(:gift) }
      let!(:gift2) { create(:gift) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            gift1.id,
            gift2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            gift2.id,
            gift1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
