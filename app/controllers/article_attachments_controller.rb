class ArticleAttachmentsController < ApplicationController
  before_action :set_article_attachment, only: [:show, :edit, :update, :destroy]

  # GET /article_attachments
  # GET /article_attachments.json
  def index
    @article_attachments = ArticleAttachment.all
  end

  # GET /article_attachments/1
  # GET /article_attachments/1.json
  def show
    @article_attachments = @article_attachment.article.article_attachments.all
  end

  # GET /article_attachments/new
  def new
    @article_attachment = ArticleAttachment.new
  end

  # GET /article_attachments/1/edit
  def edit
    @article_attachments = @article_attachment.article.article_attachments.all
  end

  # POST /article_attachments
  # POST /article_attachments.json
  def create
    @article_attachment = ArticleAttachment.new(article_attachment_params)

    respond_to do |format|
      if @article_attachment.save
        format.html #{ redirect_to @article_attachment.article, notice: 'Article attachment was successfully created.' }
        format.json { render :show, status: :created, location: @article_attachment }
      else
        format.html { render :new }
        format.json { render json: @article_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /article_attachments/1
  # PATCH/PUT /article_attachments/1.json
  def update
    respond_to do |format|
      if @article_attachment.update(article_attachment_params)
        format.html #{ redirect_to @article_attachment.article, notice: 'Article attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @article_attachment }
      else
        format.html { render :edit }
        format.json { render json: @article_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /article_attachments/1
  # DELETE /article_attachments/1.json
  def destroy
    @article_attachments = @article_attachment.article.article_attachments.all
    @article_attachment.destroy
    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article_attachment
      @article_attachment = ArticleAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_attachment_params
      params.require(:article_attachment).permit(:article_id, :image)
    end
end
