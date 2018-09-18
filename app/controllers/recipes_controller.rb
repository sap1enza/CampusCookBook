class RecipesController < ApplicationController

	def show
		id = params[:id]
		@recipe = Recipe.find(id)
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(params.require(:recipe).permit(:id,:title,:recipe_type,:cuisine,
			:difficulty,:cook_time,:ingredients,:cook_method))

		if @recipe.save
			redirect_to @recipe
		else
			flash[:alert] = "Preencha todos os campos"
			redirect_to new_recipe_path
		end

	end


end