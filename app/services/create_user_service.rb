class CreateUserService < BaseService
  def initialize(params)
    @first_name = params[:first_name]
    @last_name = params[:last_name]
  end

  def call
    user = User.create(first_name: @first_name, last_name: @last_name)
    matching_score_set = MatchingScoreSet.create(owner: user)
    return user unless other_users = User.where(:id.ne => user.id)
    other_users.each do |another_user|
      MatchingScore.create(matching_score_set: matching_score_set, owner: user, partner: another_user)
      MatchingScore.create(matching_score_set: another_user.matching_score_set, owner: another_user, partner: user)
    end
  end
end
