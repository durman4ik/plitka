class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string  :title_ru
      t.string  :title_by
      t.text    :short_content_ru
      t.text    :short_content_by
      t.text    :content_ru
      t.text    :content_by
      t.string  :head_image
      t.boolean :is_published, null: false, default: false

      t.timestamps null: false
    end
  end
end
