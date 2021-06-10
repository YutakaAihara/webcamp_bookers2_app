class BooksController < ApplicationController

  # newはviewファイル必要ないので作らない。
  # 本の一覧
  def index
    @books = Book.page(params[:page]).reverse_order
    @book = Book.new
    @user = current_user
  end

  # 新しい本をデータベースに追加
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      render :index
    end

  end

  #本の詳細画面
  def show
    @new_book = Book.new
    @book = Book.find(params[:id]).reverse_order
    @user = @book.user
    @book_comment = BookComment.new
  end

  #本の更新画面
  def edit
    @book = Book.find(params[:id])
    redirect_to books_path unless current_user.id == @book.user_id
  end

  #本の内容の変更をデータベースに更新
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  #本のデータを削除
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

end
