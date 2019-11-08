class GroupSets::GroupsController < ApplicationController
  before_action :load_resource

  def new; end

  def create
    @group = Group.new(group_set: @group_set, member_ids: params[:user_ids])
    if @group.save
      redirect_to group_set_path(@group_set), flash: { notice: "チーム作成に成功しました!" }
    else
      redirect_to group_set_path(@group_set), flash: { error: "チーム作成に失敗しました!" }
    end
  end

  def edit; end

  def update
    if @group.update_attributes(member_ids: params[:user_ids])
      redirect_to group_set_path(@group_set), flash: { notice: "チーム更新に成功しました!" }
    else
      redirect_to group_set_path(@group_set), flash: { error: "チーム更新に失敗しました!" }
    end
  end

  def destroy
    return redirect_to group_set_path(@group_set), flash: { error: "チーム削除に失敗しました!" } if @group.blank?
    if @group.delete
      redirect_to group_set_path(@group_set), flash: { notice: "チーム削除に成功しました!" }
    else
      redirect_to group_set_path(@group_set), flash: { error: "チーム削除に失敗しました!" }
    end
  end

  private
    def load_resource
      case params[:action].to_sym
      when :new
        @group = Group.new
        @group_set = GroupSet.find(params[:group_set_id])
        @users = User.active
      when :create
        @group_set = GroupSet.find(params[:group_set_id])
      when :edit
        @group = Group.find(params[:id])
        @group_set = @group.group_set
        @users = User.active
      when :update
        @group_set = GroupSet.find(params[:group_set_id])
        @group = @group_set.groups.find(params[:id])
      when :destroy
        @group_set = GroupSet.find(params[:group_set_id])
        @group = @group_set.groups.find(params[:id])
      end
    end
end
