class MatchingScoreSet
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :owner, class_name: "User"
  has_many :matching_scores

  def update_scores_by_matching!(users)
    users.each { |user| self.matching_scores.find_by(partner: user).update_score_by!(:matching) }
  end

  def update_scores_by_unmatching!(users)
    users.each { |user| self.matching_scores.find_by(partner: user).update_score_by!(:unmatching) }
  end

  def cancel_update_scores_by_matching!(users)
    users.each { |user| self.matching_scores.find_by(partner: user).cancel_update_score_by!(:matching) }
  end

  def cancel_update_scores_by_unmatching!(users)
    users.each { |user| self.matching_scores.find_by(partner: user).cancel_update_score_by!(:unmatching) }
  end
end
