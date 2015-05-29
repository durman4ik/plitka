class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string    :title_ru
      t.string    :title_by
      t.string    :description
      t.string    :head_image
      t.timestamps null: false
    end

    add_column :images, :album_id, :integer
  end
end
