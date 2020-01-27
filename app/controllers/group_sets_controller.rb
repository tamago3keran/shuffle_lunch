class GroupSetsController < ApplicationController
  before_action :load_resource

  def index; end

  def show; end

  private
    def load_resource
      case params[:action].to_sym
      when :index
        @group_sets = GroupSet.all.desc(:created_at).page(params[:page]).per(10)
      when :show
        if request.fullpath == root_path
          @group_set = GroupSet.all.desc(:created_at).first
        else
          @group_set = GroupSet.find(params[:id])
        end
        @groups = @group_set.groups
      end
    end
end
