class HomeController < ApplicationController
  def index
  end

  def o_nas
    @services = Service.all
    @advantages = Advantage.all
    @contact = Contact.new
    @about = About.first || About.create!
  end

  def portfolio
    @albums = Album.all
  end

  def articles
    @articles = Article.all
  end

  def sitemap
    path = Rails.root.join("public", "sitemaps", "sitemap.xml")
    if File.exists?(path)
      respond_to do |format|
        format.xml { render xml: open(path).read }
        format.html { redirect_to root_url }
      end
    else
      render text: "Sitemap not found.", status: :not_found
    end
  end

  def robots
    render 'home/robots'
  end
end
