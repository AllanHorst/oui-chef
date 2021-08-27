Ingredient.delete_all
Tag.delete_all
Recipe.delete_all

recipes = JSON.parse(File.read(Rails.root.join('recipes.json')))
recipes.each do |recipe_json|
    recipe = Recipe.new(recipe_json.except("ingredients", "tags", "nb_comments"))
    recipe.save!
    recipe_json["ingredients"].each do |item|
        Ingredient.create(name: item, recipe: recipe)
    end

    recipe_json["tags"].each do |item|
        Tag.create(name: item, recipe: recipe)
    end
end