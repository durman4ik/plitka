class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.string :law_info_ru
      t.string :law_info_by
      t.string :email

      t.timestamps null: false
    end
  end
end
