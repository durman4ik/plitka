class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :create, :destroy, :edit, :update]

  def index
    @albums = Album.all
  end

  def show
    @images = @album.images.all
  end

  def new
    @album = Album.new
    @image = @album.images.build
  end

  def edit
    @images = @album.images.all
    @image = @album.images.build
  end

  def create
    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save_album(album_params, params)
        flash[:notice] = 'Альбом успешно создан!'
        format.html { redirect_to dashboard_portfolio_path }
      else
        flash[:error] = "Ошибка! Не удалось создать альбом!\n" + "#{@album.errors.values.join("\n")}"
        format.html { redirect_to dashboard_portfolio_path }
      end
    end
  end

  def update
    respond_to do |format|
      if @album.update_album(album_params, params)
        flash[:notice] = 'Изменения сохранены!'
        format.html { redirect_to dashboard_portfolio_path }
      else
        if @album.errors.blank?
          flash[:error] =  'Изменения сохранены!'
        else
          flash[:error] = "Ошибка! Не удалось изменить альбом!\n" + "#{@album.errors.values.join("\n")}"
        end
        format.html { redirect_to dashboard_portfolio_path }
      end
    end
  end

  def destroy
    @albums = Album.all.includes(:images)

    @album.destroy
    respond_to do |format|
      if @album.destroy
        flash[:notice] = 'Альбом успешно удален!'
        format.html { redirect_to albums_path  }
        format.js   { render 'albums/destroy' }
      else
        flash[:notice] = 'Ошибка! Не удалось удалить альбом!'
        format.html { redirect_to albums_path }
        format.js   { render 'static/errors' }
      end
    end
  end

  private
    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:description, :title_ru, :title_by, :head_image,
                                    images_attributes: [:id, :album_id, :title, :description, :url])
    end
end
