class Recipe < ApplicationRecord

	belongs_to :recipe_type
	validates :title,:difficulty,:cook_time, presence: true

end
