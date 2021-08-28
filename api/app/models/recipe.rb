class Recipe < ApplicationRecord
    has_many :tags
    has_many :ingredients

    validates :name, presence: true


    def self.find_by_ingredients(ingredients)
        self.find_by_sql(build_sql(ingredients))
    end 

    private
    def self.build_sql(ingredients) 

        union_sql = ''
        ingredients.each_with_index do |ingredient, index|
            union_sql << %{
                select i.id from ingredients i
                where
                    to_tsvector('french', i.name) @@
                    plainto_tsquery('french', '#{ingredient}')
            }
            union_sql << ' union all ' if index + 1 < ingredients.count 
        end

        %{
            select * from
            (
                select 
                    count(r.*) as r_count, 
                    r.*,
                    (
                        select count(id) from ingredients where recipe_id = r.id
                    ) as i_count
                from recipes r
                inner join ingredients i on
                    r.id = i.recipe_id
                    and i.id in (
                    #{union_sql}
                )
                group by r.id

                order by i_count
            ) as found_recipes
            where i_count = #{ingredients.count}
        }
    end
end
