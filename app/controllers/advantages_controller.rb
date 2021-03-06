class AdvantagesController < ApplicationController

  before_action :authenticate_admin!
  def create
    @advantage = Advantage.new(advantage_params)

    respond_to do |format|
      if @advantage.save
        flash[:notice] = 'Преимущество успешно добавлено!'
        format.html { redirect_to dashboard_path }
      else
        flash[:error] = "Ошибка! Не удалось добавить преимущество!\n" + "#{@advantage.errors.values.join("\n")}"
        format.html { redirect_to dashboard_path }
      end
    end
  end

  def destroy
    @advantage = Advantage.find(params[:id])
    @advantages = Advantage.all

    respond_to do |format|
      if @advantage.destroy
        flash[:notice] = 'Преимущество успешно удалено!'
        format.html { redirect_to dashboard_path  }
        format.js   { render 'advantages/destroy' }
      else
        flash[:notice] = 'Ошибка! Не удалось удалить преимущество!'
        format.html { redirect_to dashboard_path }
        format.js   { render 'static/errors' }
      end
    end
  end

  private

    def advantage_params
      params.require(:advantage).permit(:title_ru, :title_by)
    end
end
