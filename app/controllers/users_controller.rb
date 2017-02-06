class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@spots = @user.owned_spots
		if request.xhr?
			latitude =  params[:latitude]
			longitude = params[:longitude]
			@parking_spots = Spot.near([latitude, longitude], 0.5)
			@parking_selections = []
			@parking_spots.each {|spot| @parking_selections << {id: spot.id, address: spot.address, latitude: spot.latitude, longitude: spot.longitude, price: spot.price}}
			respond_to do |format|
				response = { :selections => @parking_selections}
				format.json { render :json => response }
			end
		end
	end
end