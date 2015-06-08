class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone
  attribute :message
  attribute :nickname,  :captcha  => true

  def headers
    {
      :subject => 'Письмо с сайта:',
      :to =>  About.first.email,
      :from => %("#{name}" <info@plitochnik1.by>)
    }
  end

end