require "rails_helper"

describe Group do
  let(:user) { User.create(first_name: "test", last_name: "test") }
  let(:partner1) { User.create(first_name: "partner1", last_name: "partner1") }
  let(:partner2) { User.create(first_name: "partner2", last_name: "partner2") }
  let!(:user_matching_score_set) { MatchingScoreSet.create(owner: user) }
  let!(:partner1_matching_score_set) { MatchingScoreSet.create(owner: partner1) }
  let!(:partner2_matching_score_set) { MatchingScoreSet.create(owner: partner2) }

  before do
    User.all.to_a.repeated_combination(2).to_a.each do |combination|
      MatchingScore.create(owner: combination[0], partner: combination[1], matching_score_set: combination[0].matching_score_set, score: 1.0)
    end
  end

  describe "#matching_score" do
    let(:group) { Group.new(member_ids: [user.id, partner1.id, partner2.id]) }

    it "returns sum of matching_scores" do
      expect(group.matching_score).to eq 3.0
    end
  end

  describe "#best_partner" do
    let(:group) { Group.new(member_ids: [user.id]) }
    let(:users) { User.where(:id.in => [partner1.id, partner2.id]) }

    before do
      [user, partner2].repeated_combination(2).to_a.each do |combination|
        matching_score = MatchingScore.find_by(owner: combination[0], partner: combination[1])
        matching_score.update_attributes(score: 2.0)
      end
    end

    it "returns partner has lower score" do
      best_partner = group.best_partner(users)
      expect(best_partner).to eq partner1
    end
  end

  describe "association with restaurant" do
    let(:association) do
      described_class.reflect_on_association(:restaurant)
    end
    let(:restaurant) { Restaurant.create(name: "restaurant", url: "http://example.com", description: "delicious") }
    let(:group_set) { GroupSet.create }
    let(:group) { Group.new(group_set_id: group_set.id, member_ids: [user.id, partner1.id, partner2.id]) }

    it "returns associated class name" do
      expect(association.class_name).to eq "Restaurant"
    end

    it "belongs to restaurant" do
      group.restaurant = restaurant
      expect(group).to be_valid
    end

    it "belongs to restaurant optionally" do
      group.restaurant = nil
      expect(group).to be_valid
    end
  end
end
