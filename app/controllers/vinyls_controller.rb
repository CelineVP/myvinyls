class VinylsController < ApplicationController
  include Pagy::Backend
  before_action :authenticate_user!
  before_action :set_user, only: [:index]
  before_action :set_vinyl, only: [:archives, :show, :edit, :update, :destroy]
  before_action :set_all_vinyls, only: [:index, :archives]

  def index
    @vinyls = @user.vinyls # associer les vinyls à l'user
    if params[:query].present?
      sql_query = "artist ILIKE :query OR album ILIKE :query"
      @vinyls = Vinyl.where(sql_query, query: "%#{params[:query]}%")
    else
      @vinyls = Vinyl.all
    end
  end

  def archives
    @pagy, @archived_vinyls = pagy(@vinyls, items: 10)
  end

  def new
    @user = current_user
    @vinyl = Vinyl.new
  end

  def show
    @vinyl = Vinyl.find(params[:id])
  end

  def create
    @vinyl = current_user.vinyls.build(vinyl_params)
    @vinyl.user = current_user

    if @vinyl.photo.present?
      return @vinyl.save
    else
      @vinyl.photo.attach(
        io: File.open('app/assets/images/pochette.jpg'),
        filename: 'pochette.jpg',
        content_type: 'image/jpg'
      )
    end

    if @vinyl.save
      redirect_to @vinyl
    else
      render :new, status: :unprocessable_entity
    end
    # set_generic_photo unless @vinyl.photo.present?
    # if @vinyl.photo.present?
    #   return @vinyl.photo.attach
    # else
    #   @vinyl.photo.attach(
    #         io: File.open('app/assets/images/pochette.jpg'),
    #         filename: 'pochette.jpg',
    #         content_type: 'image/jpg'
    #       )
    # end
  end

  def edit
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

  def set_all_vinyls
    @vinyls = Vinyl.where(user_id: @user).order('date DESC')
  # A terminer = afficher par les derniers ajouter
  end


  # def set_generic_photo
  #   @vinyl.photo.attach(
  #     io: File.open('app/assets/images/pochette.jpg'),
  #     filename: 'pochette.jpg',
  #     content_type: 'image/jpg'
  #   )
  # end
  # afficher une images par defautl si pas ajouté à la main

  def set_user
    @user = current_user
  end

end

# réussier à avoir photo par default et modifier photo
