class Album < ActiveRecord::Base

  DEFAULT_IMAGE = 'default.png'

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

  mount_uploader :head_image, ImageUploader

  validates :title_ru, presence: { message: "\nНазвание на русском не может быть пустым! " }
  validates :head_image, presence: { message: "\nВыберите обложку альбома. Это обязательно!" }
  #TODO: Сделать валидацию формата для картинок и обложки.

  def save_album(album_params = {}, images_params = {})
    ActiveRecord::Base.transaction do
      save(album_params)
      save_images(images_params) unless images_params[:images_attributes].nil?
    end
  end

  def save_images(params = {})
    params[:images_attributes]['image'].each do |image|
      @image = self.images.create!(url: image, album_id: id)
    end
  end

  def update_album(album_params = {}, images_params = {})
    ActiveRecord::Base.transaction do
      update(album_params)
      save_images(images_params) unless images_params[:images_attributes].nil?
    end
  end
end
