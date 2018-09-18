class Recipe < ApplicationRecord

	validates :title,:difficulty,:cook_time, presence: true

end
