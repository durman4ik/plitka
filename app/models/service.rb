class Service < ActiveRecord::Base

  validates :title_ru, :title_by, presence: true
end
