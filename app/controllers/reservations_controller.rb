class ReservationsController < ApplicationController

  def create
    # only if user don't have any reservation, user can make new one.
    redirect_to user_path(current_user) if current_user.current_reservation != nil
    @spot = Spot.find(params[:spot_id])
    @reservation = Reservation.create(spot: @spot, user: current_user, start_time: DateTime.now)
    current_user.current_reservation = @reservation
    redirect_to user_path(current_user)
  end

  # This is for 'finish' button when user want to terminate the reservation
  def update
    @reservation = current_user.current_reservation
    @reservation.update(end_time: DateTime.now)
    current_user.current_reservation = nil
    redirect_to user_path(current_user)
  end
end
