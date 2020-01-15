class GroupSets::GroupsController < ApplicationController
  before_action :load_resource

  def show
    @group_number = params[:group_number]
  end

  def edit; end

  def update; end

  private
    def load_resource
      case params[:action].to_sym
      when :show
        @group_set = GroupSet.find(params[:group_set_id])
        @group = Group.find(params[:id])
      when :edit
        @group_set = GroupSet.find(params[:group_set_id])
        @group = Group.find(params[:id])
      when :update
        @group_set = GroupSet.find(params[:group_set_id])
        @group = @group_set.groups.find(params[:id])
      end
    end
end
