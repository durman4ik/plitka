class Advantage < ActiveRecord::Base
  validates :title_ru, presence: { message: "\nНазвание на русском не может быть пустым! " }
end
