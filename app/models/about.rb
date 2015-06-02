class About < ActiveRecord::Base

  validates :law_info_ru, presence: { message: 'Юридическая информация на русском должна быть заполнена.' }
  validates :email, presence: { message: 'Email не может быть пустым! Заполните!' }

end
