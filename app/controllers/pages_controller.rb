class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def welcome
    @vinyls = Vinyl.all
  end

  def profil
    @vinyls = Vinyl.count
  end

end
