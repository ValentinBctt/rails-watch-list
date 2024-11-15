class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])  # Trouve la liste associée
    @bookmark = @list.bookmarks.new(bookmark_params)  # Crée un nouveau bookmark pour cette liste

    if @bookmark.save
      redirect_to @list, notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)  # Assure-toi que le paramètre :movie_id est autorisé
  end
end
