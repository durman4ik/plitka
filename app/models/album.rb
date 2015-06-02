class Album < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title_ru, use: :slugged

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

  mount_uploader :head_image, ImageUploader

  validates :title_ru, presence: { message: "\nНазвание на русском не может быть пустым! " }
  validates :head_image, presence: { message: "\nВыберите обложку альбома. Это обязательно!" }

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

  def normalize_friendly_id(input)
    input.to_slug.normalize(transliterations: :russian).to_s
  end
end
