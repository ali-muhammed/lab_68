class Restaurant < ApplicationRecord
	has_one_attached :picture
	has_many :dishes
	validates :name, presence: true,
	length: { maximum: 30 }

	validates :description, presence: true,
	length: { maximum: 500 }
end
