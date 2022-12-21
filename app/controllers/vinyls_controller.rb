class VinylsController < ApplicationController
  before_action :set_vinyl, only: [:show, :edit, :update, :destroy]

  def index
    @vinyls = Vinyl.all
  end

  def new
    @vinyl = Vinyl.new
  end

  def show
  end

  def create
    @vinyl = Vinyl.new(vinyl_params)
    # @vinyl.user = current_user
    @vinyl.save
    redirect_to vinyls_path
  end

  def edit
    @vinyls = Vinyl.all
  end

  def update
    @vinyl.update(vinyl_params)
    redirect_to vinyl_path(@vinyl)
  end

  def destroy
    @vinyl.destroy
    redirect_to vinyls_path
  end

  def favorites
  end

  private

  def set_vinyl
    @vinyl = Vinyl.find(params[:id])
  end

  def vinyl_params
    params.require(:vinyl).permit(:album, :artist, :commentaire, :photo)
  end

end
