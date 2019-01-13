class MatchingScore
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :owner, class_name: "User"
  belongs_to :partner, class_name: "User"
  belongs_to :matching_score_set

  field :score, type: Float, default: 0.0

  def update_score_by!(action)
    case action
    when :matching
      self.score += 1.0
    when :unmatching
      self.score /= 2
    end
    self.save
  end

  def cancel_update_score_by!(action)
    case action
    when :matching
      self.score -= 1.0
    when :unmatching
      self.score *= 2
    end
    self.save
  end
end
