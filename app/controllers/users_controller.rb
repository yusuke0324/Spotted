class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		if request.xhr?
			latitude =  params[:latitude]
			longitude = params[:longitude]
			@parking_spots = Spot.near("#{latitude}, #{longitude}")
			@parking_selections = []
			@parking_spots.each {|spot| @parking_selections << {address: spot.address, latitude: spot.latitude, longitude: spot.longitude, price: spot.price}}
			content_type = :json
			{ parking: @parking_selections }.to_json
		end
	end
end