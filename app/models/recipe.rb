class Recipe < ApplicationRecord

	validates :title,:recipe_type,:cuisine,:difficulty,:cook_time,
	:ingredients,:cook_method, presence: true

end
