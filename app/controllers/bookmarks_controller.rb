# app/controllers/bookmarks_controller.rb
class BookmarksController < ApplicationController
    def show
      @bookmark = Bookmark.all
    end
    def new
      @list = List.find(params[:list_id])
      @bookmark = Bookmark.new
    end

    def create
      @bookmark = @list.bookmarks.new(bookmark_params)
      @bookmark.save
        redirect_to @list, notice: 'Bookmark was successfully created.'
    end

  private


  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
