class MatchingScoresController < ApplicationController
  def index
    @users = User.all
    @matching_scores = MatchingScore.all
  end
end