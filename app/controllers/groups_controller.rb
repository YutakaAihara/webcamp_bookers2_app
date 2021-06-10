class GroupsController < ApplicationController
  def index
    @groups = Group.page(params[:page]).reverse_order
    @book = Book.new
    @user = current_user
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
    @book = Book.new
    @user = current_user
    @users = @group.users.page(params[:page]).reverse_order
  end
  
  def create
    @user = current_user
    @group = @user.groups.build(group_params)
    @user.save
    redirect_to groups_path

  end

  def edit
    @group = Group.find(params[:id])
    redirect_to groups_path unless current_user.id == @group.owner_id
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to groups_path
  end


  private

  def group_params
    params.require(:group).permit(:name, :introduction, :image, { user_ids: []})
  end
end
