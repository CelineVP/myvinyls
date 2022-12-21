class PagesController < ApplicationController
  def home
  end

  def indexprincipal
    @vinyls = Vinyl.all
  end
end
