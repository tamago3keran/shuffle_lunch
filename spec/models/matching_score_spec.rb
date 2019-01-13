require "rails_helper"

describe MatchingScore do
  let(:owner) { User.new(first_name: "owner", last_name: "owner") }
  let(:partner) { User.new(first_name: "partner", last_name: "partner") }
  let(:matching_score) { MatchingScore.new(owner: owner, partner: partner, score: 1.0) }

  describe "#update_score_by" do
    context "when action is :matching" do
      it "adds 1.0 to score" do
        matching_score.update_score_by!(:matching)
        expect(matching_score.score).to eq 2.0
      end
    end

    context "when action is :unmatching" do
      it "devides score by 2" do
        matching_score.update_score_by!(:unmatching)
        expect(matching_score.score).to eq 0.5
      end
    end
  end

  describe "#cancel_update_score_by" do
    context "when action is :matching" do
      it "subtracts 1.0 from score" do
        matching_score.cancel_update_score_by!(:matching)
        expect(matching_score.score).to eq 0.0
      end
    end

    context "when action is :unmatching" do
      it "multiply score by 2" do
        matching_score.cancel_update_score_by!(:unmatching)
        expect(matching_score.score).to eq 2.0
      end
    end
  end
end
