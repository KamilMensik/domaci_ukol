class Task < ApplicationRecord
	belongs_to :user
	belongs_to :project, optional: true
	has_many :task_tags
	has_many :tags, through: :task_tags

	accepts_nested_attributes_for :tags

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
