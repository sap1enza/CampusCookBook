class AddRecipeType < ActiveRecord::Migration[5.2]
  def change
  	change_table :recipes do |t|
  		t.string :recipe_type
  	end  		
  end
end
