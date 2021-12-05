require "rails_helper"

RSpec.describe WishlistResource, type: :resource do
  describe "serialization" do
    let!(:wishlist) { create(:wishlist) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(wishlist.id)
      expect(data.jsonapi_type).to eq("wishlists")
    end
  end

  describe "filtering" do
    let!(:wishlist1) { create(:wishlist) }
    let!(:wishlist2) { create(:wishlist) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: wishlist2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([wishlist2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:wishlist1) { create(:wishlist) }
      let!(:wishlist2) { create(:wishlist) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      wishlist1.id,
                                      wishlist2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      wishlist2.id,
                                      wishlist1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
