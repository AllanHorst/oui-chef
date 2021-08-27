class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.references :recipe, index: true, foreign_key: { to_table: :recipes }

      t.timestamps
    end
  end
end
