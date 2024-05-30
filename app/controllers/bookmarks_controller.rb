class BookmarksController < ApplicationController
  before_action :set_list, only: %i[create]
  def new
    @movie = Movie.find(params[:movie_id])
    @list = List.find(params[:])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_bookmark_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end

  def set_list
    @list = List.find(params[:list_id])
   end
end
