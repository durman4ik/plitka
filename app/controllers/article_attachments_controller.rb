class ArticleAttachmentsController < ApplicationController
  before_action :set_article_attachment,  only: [:update, :destroy]
  before_action :authenticate_admin!,     only: [:create, :update, :destroy]

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

  def destroy
    @article_attachments = @article_attachment.article.article_attachments.all
    @article_attachment.destroy
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

    def set_article_attachment
      @article_attachment = ArticleAttachment.find(params[:id])
    end

    def article_attachment_params
      params.require(:article_attachment).permit(:article_id, :image)
    end
end
