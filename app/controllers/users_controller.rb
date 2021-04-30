class UsersController < ApplicationController

  # user一覧画面
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  # userの詳細
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.all
  end

  # user情報の更新画面
  def edit
    @user = User.find(params[:id])
  end

  # userの情報をデータベースに更新
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."      
      redirect_to user_path(@user.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
