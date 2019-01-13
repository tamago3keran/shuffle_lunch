require "rails_helper"

describe MatchingScoreSet do
  let(:user) { User.create(first_name: "user", last_name: "user") }
  let(:matching_score_set) { MatchingScoreSet.new(owner: user) }

  describe "#update_scores_by_matching!" do
    let(:matching_user1) { User.create(first_name: "matching_user1", last_name: "matching_user1") }
    let(:matching_user2) { User.create(first_name: "matching_user2", last_name: "matching_user2") }
    let(:matching_users) { User.where(:id.in => [matching_user1.id, matching_user2.id]) }
    let!(:matching_score1) { MatchingScore.create(owner: user, partner: matching_user1, matching_score_set: matching_score_set, score: 1.0) }
    let!(:matching_score2) { MatchingScore.create(owner: user, partner: matching_user2, matching_score_set: matching_score_set, score: 1.0) }

    it "adds 1.0 to scores" do
      matching_score_set.update_scores_by_matching!(matching_users)
      expect(matching_score1.reload.score).to eq 2.0
      expect(matching_score2.reload.score).to eq 2.0
    end
  end

  describe "#update_scores_by_unmatching!" do
    let(:unmatching_user1) { User.create(first_name: "unmatching_user1", last_name: "unmatching_user1") }
    let(:unmatching_user2) { User.create(first_name: "unmatching_user2", last_name: "unmatching_user2") }
    let(:unmatching_users) { User.where(:id.in => [unmatching_user1.id, unmatching_user2.id]) }
    let!(:matching_score1) { MatchingScore.create(owner: user, partner: unmatching_user1, matching_score_set: matching_score_set, score: 1.0) }
    let!(:matching_score2) { MatchingScore.create(owner: user, partner: unmatching_user2, matching_score_set: matching_score_set, score: 1.0) }

    it "devides scores by 2" do
      matching_score_set.update_scores_by_unmatching!(unmatching_users)
      expect(matching_score1.reload.score).to eq 0.5
      expect(matching_score2.reload.score).to eq 0.5
    end
  end

  describe "#cancel_update_scores_by_matching!" do
    let(:matching_user1) { User.create(first_name: "matching_user1", last_name: "matching_user1") }
    let(:matching_user2) { User.create(first_name: "matching_user2", last_name: "matching_user2") }
    let(:matching_users) { User.where(:id.in => [matching_user1.id, matching_user2.id]) }
    let!(:matching_score1) { MatchingScore.create(owner: user, partner: matching_user1, matching_score_set: matching_score_set, score: 1.0) }
    let!(:matching_score2) { MatchingScore.create(owner: user, partner: matching_user2, matching_score_set: matching_score_set, score: 1.0) }

    it "subtracts 1.0 from scores" do
      matching_score_set.cancel_update_scores_by_matching!(matching_users)
      expect(matching_score1.reload.score).to eq 0.0
      expect(matching_score2.reload.score).to eq 0.0
    end
  end

  describe "#cancel_update_scores_by_unmatching!" do
    let(:unmatching_user1) { User.create(first_name: "unmatching_user1", last_name: "unmatching_user1") }
    let(:unmatching_user2) { User.create(first_name: "unmatching_user2", last_name: "unmatching_user2") }
    let(:unmatching_users) { User.where(:id.in => [unmatching_user1.id, unmatching_user2.id]) }
    let!(:matching_score1) { MatchingScore.create(owner: user, partner: unmatching_user1, matching_score_set: matching_score_set, score: 1.0) }
    let!(:matching_score2) { MatchingScore.create(owner: user, partner: unmatching_user2, matching_score_set: matching_score_set, score: 1.0) }

    it "multiply scores by 2" do
      matching_score_set.cancel_update_scores_by_unmatching!(unmatching_users)
      expect(matching_score1.reload.score).to eq 2.0
      expect(matching_score2.reload.score).to eq 2.0
    end
  end
end
