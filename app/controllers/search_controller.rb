class SearchController < ApplicationController

  def search
    @keyword = params[:keyword]
    @table = params[:table]
    search_type = params[:search_type]

    if @table == "user_table"
      @users = User.search(search_type, @keyword)
    elsif @table == "book_table"
      @books = Book.search(search_type, @keyword)
    end

  end
end
