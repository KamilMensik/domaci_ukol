class Project < ApplicationRecord
	validates :user_id, presence: true
	validates :title, presence: true, length: {minimum: 1}
	validates :position, presence:true
	
	belongs_to :user
	has_many :tasks, dependent: :destroy

	scope :cur_user, -> (user) { where(user_id: user.id) }

	def self.search(search)
		if search
			Project.where('title LIKE ?', "%#{search}%")
		else
			Project.all
		end
	end
end
