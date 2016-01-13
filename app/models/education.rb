class Education < ActiveRecord::Base
	validates :qualification, :school, :year, presence: true

	belongs_to :profile
end
