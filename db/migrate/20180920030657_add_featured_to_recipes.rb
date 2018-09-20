class AddFeaturedToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :featured, :boolean
    change_column_default :recipes, :featured, false
  end
end
