class DashboardsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @services = Service.all
    @advantages = Advantage.all
  end

  def portfolio
    @albums = Album.all.includes(:images)
  end

  def articles
    @articles = Article.includes(:article_attachments).all
  end
end
