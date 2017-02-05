class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		if request.xhr?
			latitude =  params[:latitude]
			longitude = params[:longitude]
			@parking_spots = Spot.near("#{latitude}, #{longitude}")
			p @parking_spots
		end
	end
end