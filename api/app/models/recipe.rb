class Recipe < ApplicationRecord
    validates :name, :author, :difficulty, :people_quantity, :cook_time, :total_time, :image, :author_tip, :budget, :prep_time, :rate, :country_code, presence: true
end
