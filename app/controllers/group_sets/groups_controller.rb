class GroupSets::GroupsController < ApplicationController
  before_action :load_resource

  def show; end

  def edit
    @restaurants = Restaurant.search(params[:keyword]).desc(:created_at)
    if params[:keyword] && @restaurants.size != 0
       flash.now[:notice] = "#{@restaurants.size}件見つかりました!"
    elsif @restaurants.size == 0
      @restaurants = Restaurant.all.desc(:created_at)
      flash.now[:error] = "お店が見つかりませんでした"
    end
  end

  def update
    if @group.update_attributes(restaurant: params[:group][:restaurant])
      if request.referrer.include?("edit")
        flash[:notice] = "更新に成功しました！"
      else
        flash[:notice] = "#{@group.restaurant.name}に決まりました！"
      end
    else
      flash[:error] = "更新に失敗しました"
    end
    redirect_to group_set_group_path(@group_set, @group, group_number: @group_number)
  end

  private
    def load_resource
      case params[:action].to_sym
      when :show
        @group_set = GroupSet.find(params[:group_set_id])
        @group = @group_set.groups.find(params[:id])
        @group_number = params[:group_number]
        @restaurants = Restaurant.all
      when :edit
        @group_set = GroupSet.find(params[:group_set_id])
        @group = @group_set.groups.find(params[:id])
        @group_number = params[:group_number]
      when :update
        @group_set = GroupSet.find(params[:group_set_id])
        @group = @group_set.groups.find(params[:id])
        @group_number = params[:group_number]
      end
    end
end
