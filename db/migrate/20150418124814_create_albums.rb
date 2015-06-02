class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string    :title_ru
      t.string    :title_by
      t.string    :head_image
      t.string    :slug,        unique: true

      t.timestamps null: false
    end

    add_index :albums, :slug
  end
end
