class Album < ActiveRecord::Base

  DEFAULT_IMAGE = 'default.png'

  has_many :images
  accepts_nested_attributes_for :images

  def save_album(params = {})
    unless params[:images].blank? #TODO: вынести два одинаковых метода в модель.
      save if new_record?
      params[:images]['image'].each do |i|
        @image = images.create!(url: i, album_id: id)
      end
      self.head_image = params[:images]['image'].first.url
      save
    end

  end
end
