class MatchingScoresController < ApplicationController
  def index
    array = User.where(active: true).pluck(:id).combination(2).to_a
    @matching_scores =
    array.map do |ary|
      MatchingScore.find_by(owner_id: ary.first, partner_id: ary.last)
    end
  end
end