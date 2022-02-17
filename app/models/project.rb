class Project < ApplicationRecord
	validates :user_id, presence: true
	validates :title, presence: true, length: {minimum: 1}
	validates :position, presence:true
	
	belongs_to :user
	has_many :tasks, dependent: :destroy
end
