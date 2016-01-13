class ProfilesController < ApplicationController
	def new
	end

	def create
		file = user_params[:file].tempfile
		byebug
		if is_json?(file)
			flash[:notice] = "It works!"
			redirect_to "/profile"
		else
			flash[:alert] = "Please upload a valid JSON file."
			render "new"
		end

	end

	def show
	end

	private

	def user_params
		params.require(:profile).permit(:file)
	end 
end
