class PhonesController < ApplicationController

  before_action :set_phone, only: [:destroy]
  before_action :authenticate_admin!

  def create
    @phone = Phone.new(phone_params)

    respond_to do |format|
      if @phone.save
        flash[:notice] = 'Номер успешно создан!'
        format.html { redirect_to dashboard_path }
      else
        flash[:error] = 'Ошибка! Не удалось удалить номер!'
        format.html { redirect_to dashboard_path }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @phone.destroy
        flash[:notice] = 'Номер успешно удален!'
        format.html { redirect_to dashboard_path }
        format.js
      else
        flash[:error] = 'Ошибка! Не удалось удалить номер!'
        format.html { redirect_to dashboard_path }
      end
    end
  end

  private

  def set_phone
    @phone = Phone.find(params[:id])
  end

  def phone_params
    params.require(:phone).permit(:number, :operator)
  end
end
