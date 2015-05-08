class Service < ActiveRecord::Base

  validates :title_ru, presence: { message: "\nНазвание на русском не может быть пустым! ".html_safe }
  validates :title_by, presence: { message: "\nНазвание на беларусском не может быть пустым! " }
end
