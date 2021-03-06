class UsersController < ApplicationController
  # user一覧画面
  def index
    @user = current_user
    @users = User.page(params[:page])
    @book = Book.new
  end

  # userの詳細
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  end

  # user情報の更新画面
  def edit
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) unless current_user.id == @user.id    
  end

  # userの情報をデータベースに更新
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  def following
    @user = User.find(params[:id])
    @users = @user.following.all
    render 'show_following'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.all
    render 'show_follower'
  end
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


end
