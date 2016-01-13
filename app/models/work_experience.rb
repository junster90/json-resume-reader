class WorkExperience < ActiveRecord::Base
	validates :company, :position, :year, presence: true

	belongs_to :profile
end
