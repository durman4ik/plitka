class ServicesController < ApplicationController
  before_action :set_service, only: [:destroy]
  # before_action :clear_flash

  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        flash[:notice] = 'Услуга успешно создана!'
        format.html { redirect_to dashboard_path }
      else
        flash[:error] = 'Ошибка! Не удалось создать услугу!'
        format.html { redirect_to dashboard_path }
      end
    end
  end

  def destroy
    @services = Service.all

    respond_to do |format|
      if @service.destroy
        flash[:notice] = 'Услуга успешно удалена!'
        format.html { redirect_to dashboard_path  }
        format.js   { render 'services/destroy' }
      else
        flash[:notice] = 'Ошибка! Не удалось удалить услугу!'
        format.html { redirect_to dashboard_path }
        format.js   { render 'static/errors' }
      end
    end
  end

  private

    def clear_flash
      flash.clear
    end

    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:title_ru, :title_by)
    end
end
