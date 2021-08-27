class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.references :recipe, index: true, foreign_key: { to_table: :recipes }

      t.timestamps
    end
  end
end
