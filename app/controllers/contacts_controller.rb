class ContactsController < ApplicationController

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:info] = 'Сообщение отправлено.'
      redirect_to :back
    else
      flash[:info] = 'Чтото пошло не так и сообщение не отправлено.'
      redirect_to :back
    end
  end
end
