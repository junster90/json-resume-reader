class Profile < ActiveRecord::Base
	validates :name, :phone, :email, :street, :city, :postcode, :state, :about, :languages, presence: :true
	validates :email, uniqueness: true

	has_many :work_experiences, :educations, :projects
end
