class UsersController < ApplicationController

	def show
		@location = Geocoder.coordinates("173.46.64.174")
		p @location
		@user = User.find(params[:id])
	end
end