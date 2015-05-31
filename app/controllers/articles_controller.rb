class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :create, :destroy, :edit, :update]

  def index
    @articles = Article.all
  end

  def show
    @article_attachments = @article.article_attachments.all
    @images = @article_attachments.map { |x| x.image }
  end

  def new
    @article = Article.new
    @article_attachment = @article.article_attachments.build
  end

  def edit
    @article_attachments = @article.article_attachments.all
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        unless params[:article_attachments].nil? #TODO: вынести два одинаковых метода в модель.
          params[:article_attachments]['image'].each do |i|
            @article_attachment = @article.article_attachments.create!(image: i, article_id: @article.id)
          end
        end
        format.html { redirect_to dashboards_article_path(@article), notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        unless params[:article_attachments].nil?
          params[:article_attachments]['image'].each do |i|
            @article_attachment = @article.article_attachments.create!(image: i, article_id: @article.id)
          end
        end
        format.html { redirect_to dashboards_article_path(@article), notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :published,
                                      article_attachments_attributes: [:id, :article_id, :image])
    end
end
