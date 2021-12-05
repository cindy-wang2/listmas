require "rails_helper"

RSpec.describe RelationshipResource, type: :resource do
  describe "serialization" do
    let!(:relationship) { create(:relationship) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(relationship.id)
      expect(data.jsonapi_type).to eq("relationships")
    end
  end

  describe "filtering" do
    let!(:relationship1) { create(:relationship) }
    let!(:relationship2) { create(:relationship) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: relationship2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([relationship2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:relationship1) { create(:relationship) }
      let!(:relationship2) { create(:relationship) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      relationship1.id,
                                      relationship2.id,
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
                                      relationship2.id,
                                      relationship1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
