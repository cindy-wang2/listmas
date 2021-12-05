require "rails_helper"

RSpec.describe RelationshipResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "relationships",
          attributes: {},
        },
      }
    end

    let(:instance) do
      RelationshipResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Relationship.count }.by(1)
    end
  end

  describe "updating" do
    let!(:relationship) { create(:relationship) }

    let(:payload) do
      {
        data: {
          id: relationship.id.to_s,
          type: "relationships",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      RelationshipResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { relationship.reload.updated_at }
      # .and change { relationship.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:relationship) { create(:relationship) }

    let(:instance) do
      RelationshipResource.find(id: relationship.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Relationship.count }.by(-1)
    end
  end
end
