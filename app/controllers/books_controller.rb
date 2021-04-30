class BooksController < ApplicationController

  # newはそれ自体のファイルは必要ないので作らない。
  # 本の一覧
  def index
    @books = Book.page(params[:page]).reverse_order
    @book = Book.new
    @user = current_user
  end

  # 新しい本をデータベースに追加
  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to books_path
  end

  #本の詳細画面
  def show
    @book = Book.new
    @show_book = Book.find(params[:id])
    @user = @show_book.user

  end

  #本の更新画面
  def edit
  end

  #本の内容の変更をデータベースに更新
  def update
  end

  #本のデータを削除
  def destroy
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
