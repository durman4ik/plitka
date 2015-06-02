class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :create, :destroy, :edit, :update]

  def index
    @articles = Article.published
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save!
        flash[:notice] = 'Статья успешно создана!'
        format.html { redirect_to dashboard_articles_path }
      else
        flash[:error] = "Ошибка! Не удалось создать статью!\n" + "#{@article.errors.values.join("\n")}"
        format.html { redirect_to dashboard_articles_path }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        flash[:notice] = 'Изменения сохранены!'
        format.html { redirect_to dashboard_articles_path }
      else
        flash[:error] = "Ошибка! Не удалось изменить статью!\n" + "#{@article.errors.values.join("\n")}"
        format.html { redirect_to dashboard_articles_path }
      end
    end
  end

  def destroy
    @articles = Article.all

    @article.destroy
    respond_to do |format|
      if @article.destroy
        flash[:notice] = 'Статья успешно удалена!'
        format.html { redirect_to albums_path  }
        format.js   { render 'articles/destroy' }
      else
        flash[:notice] = 'Ошибка! Не удалось удалить статью!'
        format.html { redirect_to albums_path }
        format.js   { render 'static/errors' }
      end
    end
  end

  private
    def set_article
      @article = Article.friendly.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title_ru, :title_by, :short_content_ru, :short_content_by, :slug,
                                      :content_ru, :content_by, :head_image, :is_published)
    end
end
