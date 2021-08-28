class RecipeController < ApplicationController

    def find_by_ingredients
        render json: Recipe.find_by_ingredients(ingredients_params[:ingredients])
    end

    private
    def ingredients_params
        params.permit(ingredients: [])
    end
end
