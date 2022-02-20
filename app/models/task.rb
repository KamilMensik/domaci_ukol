class Task < ApplicationRecord
	validates :user_id, presence: true
	validates :title, presence: true, length: {minimum: 1}
	validates_inclusion_of :is_done, in: [true, false]
	mount_uploader :file, FileUploader

	belongs_to :user
	belongs_to :project, optional: true
	has_many :task_tags
	has_many :tags, through: :task_tags

	accepts_nested_attributes_for :tags


	scope :cur_user, -> (user) { where(user_id: user.id) }

	def self.search(search)
		if search
			self.where('title LIKE ?', "%#{search}%")
		else
			self.all
		end
	end

	def self.set_scope(params)
		if params
			if params[:is_done] != nil
				self.where(is_done:params[:is_done])
			elsif params[:project]
				self.where(project_id:params[:project])
			else
				self.all
			end
		else
			self.all
		end
	end

	def show_tags
		tags_string = ""
		unless self.tags == nil
			self.tags.each do |tag|
				tags_string+="#{tag.title} "
			end
		end
		return tags_string
	end

end
