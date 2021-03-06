class UsersController < ApplicationController
	def show
		if current_user && current_user.id == params[:id].to_i
			@user = User.find(params[:id])
			@spots = @user.owned_spots
			if (@user.current_reservation)
				@reservation = @user.current_reservation
				gon.reservation = @reservation
				@location = @reservation.spot
				gon.latitude = @location.latitude
				gon.longitude = @location.longitude
			else
				gon.no_reservation = "none"
			end
			if request.xhr?
				latitude =  params[:latitude]
				longitude = params[:longitude]
				@parking_spots = Spot.near([latitude, longitude], 0.5).limit(4)
				@parking_spots = @parking_spots.select{|spot| spot.availability == true}
				@parking_display = render_to_string(partial: 'parking')
				@parking_selections = []
				@parking_spots.each {|spot| @parking_selections << {id: spot.id, address: spot.address, latitude: spot.latitude, longitude: spot.longitude, price: spot.price}}
				respond_to do |format|
					response = { selections: @parking_selections, display: @parking_display}
					format.json { render :json => response }
				end
			end
			@spots = @user.owned_spots
		else
			redirect_to new_user_session_path
		end
	end
end