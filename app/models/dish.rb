class Dish < ApplicationRecord
	has_one_attached :picture
	belongs_to :restaurant
	validates :name, presence: true
	validates :description, presence: true
end
