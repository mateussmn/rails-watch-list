class BookmarksController < ApplicationController
  def new
    @movie = Movie.all.order(:title)
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    @bookmark.save
    redirect_to @list
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie)
  end
end
