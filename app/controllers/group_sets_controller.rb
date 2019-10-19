class GroupSetsController < ApplicationController
  before_action :load_resource

  def index; end

  def show; end

  def new; end

  def create
    group_set = ShuffleService.call(@users, params[:group_num].to_i)
    group_set.save_with_groups
    redirect_to group_set_path(group_set)
  end

  def destroy
    if @group_set.groups.map(&:delete) && @group_set.destroy
      redirect_to group_sets_path, flash: { notice: "チーム分けの削除に成功しました!" }
    else
      redirect_to group_sets_path, flash: { error: "チーム分けの削除に失敗しました!" }
    end
  end

  private
    def load_resource
      case params[:action].to_sym
      when :index
        @group_sets = GroupSet.all.desc(:created_at).page(params[:page]).per(10)
      when :show
        @group_set = GroupSet.find(params[:id])
        @groups = @group_set.groups
      when :new
        @users = User.all
      when :create
        @users = User.where(:id.in => params[:user_ids])
      when :destroy
        @group_set = GroupSet.find(params[:id])
      end
    end
end
