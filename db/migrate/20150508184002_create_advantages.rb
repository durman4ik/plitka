class CreateAdvantages < ActiveRecord::Migration
  def change
    create_table :advantages do |t|
      t.string :title_ru
      t.string :title_by

      t.timestamps null: false
    end
  end
end
