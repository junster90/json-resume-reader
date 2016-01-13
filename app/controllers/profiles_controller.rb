class ProfilesController < ApplicationController
	def new
	end

	def create
		file = user_params[:file]
		if is_json?(file.tempfile)
			json = JSON.parse(file.read)
			@profile = Profile.new
			
			redirect_to "/profile"
		else
			flash[:alert] = "Please upload a valid JSON file."
			render "new"
		end

	end

	def show
		@profile = Profile.last
	end

	private

	def user_params
		params.require(:profile).permit(:file)
	end 
end
