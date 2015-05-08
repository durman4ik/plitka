class HomeController < ApplicationController
  def index
  end

  def o_nas
    @services = Service.all
  end

  def portfolio
    @albums = Album.all
  end

  def articles
    @articles = Article.all
  end
end
