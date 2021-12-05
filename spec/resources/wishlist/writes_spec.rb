require 'rails_helper'

RSpec.describe WishlistResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'wishlists',
          attributes: { }
        }
      }
    end

    let(:instance) do
      WishlistResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Wishlist.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:wishlist) { create(:wishlist) }

    let(:payload) do
      {
        data: {
          id: wishlist.id.to_s,
          type: 'wishlists',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      WishlistResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { wishlist.reload.updated_at }
      # .and change { wishlist.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:wishlist) { create(:wishlist) }

    let(:instance) do
      WishlistResource.find(id: wishlist.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Wishlist.count }.by(-1)
    end
  end
end
