class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title_ru
      t.string :title_by
      t.text :content_ru
      t.text :content_by
      t.boolean :is_published

      t.timestamps null: false
    end
  end
end
