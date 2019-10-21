class Group
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :group_set

  field :member_ids, type: Array, default: []

  def matching_score
    self.member_ids.combination(2).reduce(0) do |sum, combination|
      sum + MatchingScore.find_by(owner: combination[0], partner: combination[1]).score
    end
  end

  def members
    User.where(:id.in => self.member_ids)
  end

  def partners(user)
    User.where(:id.in => partner_ids(user))
  end

  def other_groups_users
    User.where(:id.in => other_groups_user_ids)
  end

  def best_partner(users)
    best_matching_score, best_partner = nil, nil
    users.each do |user|
      group = Group.new(member_ids: self.member_ids)
      group.member_ids << user.id
      if best_matching_score.nil? || best_matching_score > group.matching_score
        best_matching_score = group.matching_score
        best_partner = user
      end
    end
    best_partner
  end

  private
    def partner_ids(user)
      self.member_ids.reject { |member_id| member_id == user.id.to_s }
    end

    def other_groups_user_ids
      User.all.pluck(:id).map(&:to_s) - self.member_ids
    end
end
