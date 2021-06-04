class FavoritesController < ApplicationController

  def create
    unless current_user.favorites.include?(clicked_like)
      @book = Book.find(params[:book_id])
      favorite = current_user.favorites.new(book_id: @book.id)
      favorite.save
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: @book.id)
    favorite.destroy
  end

  private

  def clicked_like
    Book.find(params[:book_id])
  end

end
