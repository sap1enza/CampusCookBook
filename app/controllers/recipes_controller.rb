class RecipesController < ApplicationController

	def show
		id = params[:id]
		@recipe = Recipe.find(id)
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)

		if @recipe.save
			redirect_to @recipe
		else
			flash[:alert] = "Você deve informar todos os dados da receita"
			redirect_to new_recipe_path
		end

	end

	def edit
		@recipe = Recipe.find(params[:id])
	end

	def update
		@recipe = Recipe.find(params[:id])
		if @recipe.update_attributes(recipe_params)
			flash[:success] = "Receita atualizada"
			redirect_to @recipe
		else
			flash[:alert] = "Você deve informar todos os dados da receita"
			redirect_to edit_recipe_path(@recipe)
		end

	end

	def recipe_params
		params.require(:recipe).permit(:id,:title,:recipe_type,:cuisine,
			:difficulty,:cook_time,:ingredients,:cook_method)
	end


end