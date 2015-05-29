class Album < ActiveRecord::Base

  DEFAULT_IMAGE = 'default.png'

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

  def save_album(params = {})
    unless params[:images].blank? #TODO: вынести два одинаковых метода в модель.
      save if new_record?
      transaction do
        params[:images]['image'].each_with_index do |image, index|
          self.head_image = image if index == 0
          @image = images.create!(url: image, album_id: id)
        end
        save
      end
    end
  end
end
