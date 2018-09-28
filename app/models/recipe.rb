class Recipe < ApplicationRecord

	belongs_to :recipe_type
	belongs_to :cuisine

	has_attached_file :photo, default_url: "/missing.png"
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

	validates :title,:difficulty,:cook_time, presence: true

end
