class GroupsController < ApplicationController
  before_action :group_join, only: [:show]
  
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
      @group.users << current_user
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
  
  def group_join
    @group = Group.find(params[:id])
    unless @group.users.exists?(current_user.id)
      @group.users << current_user
      flash.now[:success] = "グループに参加しました"
    end
  end

end
