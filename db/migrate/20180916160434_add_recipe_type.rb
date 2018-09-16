class AddRecipeType < ActiveRecord::Migration[5.2]
  def change
  	change_table :recipes do |t|
  		t.string :recipe_type
  	end  		
  end
end


    # add_column :recipes, :ingredients, :strings
    # add_column :recipes, :cook_method, :string