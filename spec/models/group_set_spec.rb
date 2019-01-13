require "rails_helper"

describe GroupSet do
  let(:group_set) { GroupSet.new }
  let!(:group1) { Group.new(group_set: group_set) }
  let!(:group2) { Group.new(group_set: group_set) }

  describe "#save_with_groups" do
    before { group_set.save_with_groups }

    it "saves group_set and groups" do
      expect(GroupSet.all.count).to eq 1
      expect(Group.all.count).to eq 2
    end
  end

  describe "#total_matching_score" do
    before do
      allow(group_set).to receive(:groups).and_return([group1, group2])
      allow(group1).to receive(:matching_score).and_return(1.0)
      allow(group2).to receive(:matching_score).and_return(1.0)
    end

    it "returns sum of group matching_scores" do
      expect(group_set.total_matching_score).to eq 2.0
    end
  end
end
