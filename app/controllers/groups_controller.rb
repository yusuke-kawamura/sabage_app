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
    @group = current_user.groups.create(group_params)
    if @group.save
       redirect_to @group, success: "グループを作成しました"
    else
      render "new"
    end
  end
  
  def edit
    @group = current_user.groups.find(params[:id]) 
  end
  
  def update
    @group = current_user.groups.find(params[:id]) 
    if @group.update(group_params)
      redirect_to group_path, success: "プロフィールを更新しました"
    else
      render 'edit'
    end
  end
  
  private
  
  def group_params
    params.require(:group).permit(:name, :description)
  end
end
