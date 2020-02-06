class GroupsController < ApplicationController
  
  def show
     @group = Group.find(params[:id])
  end
  
  def index
    @groups = Group.all
  end
  
  def new
    @group = Group.new
    @group.group_user.build
  end
  
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to @group, success: "グループを作成しました"
    else
      render "new"
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def group_params
    params.require(:group).permit(:name, :free, user_ids: [])
  end
end
