class ContactsController < ApplicationController

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request

    respond_to do |format|

      if @contact.deliver!
        flash[:info] = 'Сообщение отправлено.'
        format.js { render 'contacts/create'}
        @contact = Contact.new
      else
        flash[:info] = 'Чтото пошло не так и сообщение не отправлено.'
        format.js { render 'static/errors' }
      end
    end
  end
end
