class ProfilesController < ApplicationController
	def new
		Profile.last.destroy if Profile.last
	end

	def create
		if params[:profile] == nil
			flash[:alert] = "Select a JSON file to upload."
			redirect_to '/'
		else
			file = user_params[:file]
			if is_json?(file.tempfile)
				json = JSON.parse(file.read)
				@profile = Profile.new
				@profile.name = json["name"]
	    	@profile.phone = json["phone"]
	    	@profile.email = json["email"]
	    	@profile.street = json["address"]["street"]
	    	@profile.city = json["address"]["city"]
	    	@profile.postcode = json["address"]["postcode"]
	    	@profile.state = json["address"]["state"]
	    	@profile.image = json["image"]
	    	@profile.about = json["about"]
	    	@profile.languages = json["languages"]

	    	if @profile.save

	    		json["education"].each do |edu|
	    			e = Education.new(edu)
	    			e.profile_id = @profile.id 
	    			e.save
	    		end

	    		json["workExperience"].each do |exp|
	    			w = WorkExperience.new(exp)
	    			w.profile_id = @profile.id 
	    			w.save
	    		end

	    		json["projects"].each do |pro|
	    			p = Project.new(pro)
	    			p.profile_id = @profile.id 
	    			p.save
	    		end

					redirect_to "/profile"

				else
					flash[:alert] = "Please upload a properly formatted resume JSON."
					render "new"
				end

			else
				flash[:alert] = "Please upload a valid JSON file."
				render "new"
			end
		end
	end

	def show
		if Profile.last
			@profile = Profile.last
		else
			redirect_to '/'
			flash[:alert] = "Please upload a resume JSON to view it's profile."
		end
	end

	private

	def user_params
		params.require(:profile).permit(:file)
	end 
end
