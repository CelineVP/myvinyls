class VinylsController < ApplicationController

  def index
    @vinyls = Vinyl.all
  end

  def new
    # @list = List.find(params[:list_id])
    # @bookmark = Bookmark.new
  end

  def show
    # @dragon = Dragon.find(params[:id])
    # @booking = Booking.new
  end

  def create
    # @list = List.find(params[:list_id])
    # @bookmark = Bookmark.new(bookmark_params)
    # @bookmark.list = @list
    # if @bookmark.save
    #   redirect_to list_path(@list)
    # else
    #   render template: "lists/show"
    # end
  end

  def destroy
    # @bookmark = Bookmark.find(params[:id])
    # @bookmark.destroy
    # redirect_to root_path
  end

  # private

  # def find_list
  #   @list = List.find(params[:list_id])
  # end

  # def bookmark_params
  #   params.require(:bookmark).permit(:comment, :movie_id)
  # end

end
