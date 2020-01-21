class Users::MatchingScoresController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @matching_scores = MatchingScore.where(owner_id: params[:user_id]).order(score: :desc)
  end
end
