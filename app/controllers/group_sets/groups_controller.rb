class GroupSets::GroupsController < ApplicationController
  before_action :load_resource

  def show; end

  def edit; end

  def update; end

  private
    def load_resource
      case params[:action].to_sym
      when :show
        @group_set = GroupSet.find(params[:group_set_id])
        @group = @group_set.groups.find(params[:id])
        @group_number = params[:group_number]
      when :edit
        @group_set = GroupSet.find(params[:group_set_id])
        @group = @group_set.groups.find(params[:id])
        @group_number = params[:group_number]
        @restaurants = Restaurant.all
      when :update
        @group_set = GroupSet.find(params[:group_set_id])
        @group = @group_set.groups.find(params[:id])
        @group_number = params[:group_number]
      end
    end
end
