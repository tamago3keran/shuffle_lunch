class UsersController < ApplicationController

  def index 
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @matching_scores = MatchingScore.find_by(owner_id: params[:id])
  end
end