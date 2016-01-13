class Profile < ActiveRecord::Base
	validates :name, :phone, :email, :street, :city, :postcode, :state, :about, :languages, presence: :true
	validates :email, uniqueness: true

	has_many :work_experiences, dependent: :destroy
	has_many :educations, dependent: :destroy
	has_many :projects, dependent: :destroy

end
