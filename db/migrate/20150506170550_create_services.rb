class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title_ru
      t.string :title_by
      t.string :image

      t.timestamps null: false
    end
  end
end
