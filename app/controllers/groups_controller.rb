class GroupsController < ApplicationController
  
  def show
     @group = Group.find(params[:id])
  end
  
  def index
    @groups = Group.all
  end
  
  def new
    @group = Group.new
  end
  
  def create
    @group = current_user.groups.build(group_params)
    if @group.save
       redirect_to @group, success: "グループを作成しました"
    else
      render "new"
    end
  end

  private
  
  def group_params
    params.require(:group).permit(:name, :group_about, user_ids: [])
  end
end
