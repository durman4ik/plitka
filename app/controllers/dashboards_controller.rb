class DashboardsController < ApplicationController
  def index
    @images = Image.all
    @services = Service.all
  end

  def portfolio
    @albums = Album.all
  end

  def articles

  end
end
