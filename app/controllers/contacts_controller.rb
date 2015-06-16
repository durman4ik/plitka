class ContactsController < ApplicationController

  after_action :clear_flash

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request

    respond_to do |format|
      if @contact.check_fields
        flash[:does_not_sent] = t('about.form.message_enter_email')
        format.js { render 'contacts/create' }
      else
        if @contact.deliver!
          flash[:sent] = t('about.form.message_sent')
          format.js { render 'contacts/create' }
          @contact = Contact.new
        else
          flash[:does_not_sent] = t('about.form.message_was_not_send')
          format.js { render 'contacts/create' }
        end
      end
    end
  end

  private

  def clear_flash
    flash.clear
  end
end
