class Article < ActiveRecord::Base

  mount_uploader :head_image, ImageUploader
  #TODO: Сделать валидации.

  scope :published, -> { where(is_published:  true)}
end
