class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title_ru, use: :slugged

  mount_uploader :head_image, ImageUploader


  validates :title_ru, presence: { message: "\nНазвание на русском не может быть пустым! " }
  validates :short_content_ru, presence: { message: 'Краткое описание на русском не может быть пустым!' }
  validates :content_ru, presence: { message: 'Содержание статьи на русском не может быть пустым! '}
  validates :head_image, presence: { message: 'Необходимо выбрать обложку статьи!'}
  validates :title_ru, :title_by, length: { maximum: 200,
                                            too_long: 'Максимально допустимая длина заголовка %{count} знаков'}


  scope :published, -> { where(is_published:  true) }

  def normalize_friendly_id(input)
    input.to_slug.normalize(transliterations: :russian).to_s
  end
end
