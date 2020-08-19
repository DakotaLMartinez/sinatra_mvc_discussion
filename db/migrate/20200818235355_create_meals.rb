class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.float :price
      t.string :spicyness
      t.string :short_description

      t.timestamps null: false
    end
  end
end
