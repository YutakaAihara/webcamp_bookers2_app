class SearchController < ApplicationController
  
  def search
    @keyword = params[:keyword]
    @table = params[:table]
    @search_type = params[:search_type]
    
    if @table == "uaer_table"
      @objects = User.search(@serch_type, @keyword)
    elsif @table == "book_table"
      @objects = Book.search(@serch_type, @keyword)
    end

  end
end
