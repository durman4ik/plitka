class ImagesController < ApplicationController
  before_action :set_image
  before_action :authenticate_admin!

  def destroy
    @album = Album.find(params[:album_id])
    @images = Image.where(album_id: params[:album_id])

    respond_to do |format|
      if @image.destroy
        flash[:notice] = 'Фотография успешно удалена!'
        format.html { redirect_to albums_path  }
        format.js   { render 'images/destroy' }
      else
        flash[:notice] = 'Ошибка! Не удалось удалить фотографию из альбома!'
        format.html { redirect_to albums_path }
        format.js   { render 'static/errors' }
      end
    end
  end

    private

    def set_image
      @image = Image.find(params[:id])
    end
end
