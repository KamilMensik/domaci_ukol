class Tag < ApplicationRecord
	validates :user_id, presence: true
	validates :title, presence: true, length: {minimum: 1}

	belongs_to :user
	
	has_many :task_tags
	has_many :tasks, through: :task_tags
end
