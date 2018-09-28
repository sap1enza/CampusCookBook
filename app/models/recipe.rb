class Recipe < ApplicationRecord

	belongs_to :recipe_type
	belongs_to :cuisine
	validates :title,:difficulty,:cook_time, presence: true

end
