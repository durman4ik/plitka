class AboutsController < ApplicationController
  before_action :set_about, only: [:update, :destroy]
  before_action :authenticate_admin!

  def create
    @about = About.new(about_params)
    respond_to do |format|
      if @about.save!
        flash[:notice] = 'Информация о Вас успешно сохранена!'
        format.html { redirect_to dashboard_path }
      else
        flash[:error] = "Не удалось сохранить информацию о вас!\n" + "#{@about.errors.values.join("\n")}"
        format.html { redirect_to dashboard_path }
      end
    end
  end

  def update
    respond_to do |format|
      if @about.update(about_params)
        flash[:notice] = 'Изменения сохранены!'
        format.html { redirect_to dashboard_path }
      else
        flash[:error] = "Не удалось сохранить информацию о вас!\n" + "#{@about.errors.values.join("\n")}"
        format.html { redirect_to dashboard_path }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @about.destroy
        flash[:notice] = 'Информация о Вас успешно удалена!'
        format.html { redirect_to dashboard_path  }
        format.js   { render 'abouts/destroy' }
      else
        flash[:error] = 'Не удалось удалить информацию о Вас.' + "#{@about.errors.values.join("\n")}"
        format.html { redirect_to dashboard_path  }
        format.js   { render 'static/error' }
      end
    end
  end

  private

  def set_about
    @about = About.find(params[:id])
  end

  def about_params
    params.require(:about).permit(:law_info_ru, :law_info_by, :email)
  end
end
