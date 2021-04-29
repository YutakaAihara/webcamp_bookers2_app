class UsersController < ApplicationController

  # user一覧画面
  def index
  end

  # userの詳細
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book

  end

  # user情報の更新画面
  def edit
  end

  # userの情報をデータベースに更新
  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
