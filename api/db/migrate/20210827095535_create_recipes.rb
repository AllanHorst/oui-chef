class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :author
      t.string :difficulty
      t.integer :people_quantity
      t.string :cook_time
      t.string :total_time
      t.string :image
      t.string :author_tip
      t.string :budget
      t.string :prep_time
      t.integer :rate
      t.integer :country_code

      t.timestamps
    end
  end
end
