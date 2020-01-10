class Admin::GroupSets::AppliedStatusesController < ApplicationController
  before_action :logged_in_admin_user

  def update
    @group_set = GroupSet.find(params[:group_set_id])
    params[:cancel_update] ? CancelUpdateMatchingScoresService.call(@group_set) :
                             UpdateMatchingScoresService.call(@group_set)
    redirect_to admin_group_sets_path
  end
end
