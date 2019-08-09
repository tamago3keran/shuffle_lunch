class GroupSetsController < ApplicationController
  def index
    @group_sets = GroupSet.all
  end

  def show
    @groups = GroupSet.find(params[:id]).groups
  end

  def new
    @users = User.all
  end

  def create
    @users = User.where(:id.in => params[:user_ids])
    group_set = ShuffleService.call(@users, params[:group_num].to_i)
    group_set.save_with_groups
    redirect_to group_set_path(group_set)
  end
end
