class Restaurant < ApplicationRecord

	validates :name, presence: true,
	length: { maximum: 30 }

	validates :description, presence: true,
	length: { maximum: 500 }
end
