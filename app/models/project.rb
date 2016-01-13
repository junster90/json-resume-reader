class Project < ActiveRecord::Base
	validates :name, :description, presence: true

	belongs_to :profile
end
