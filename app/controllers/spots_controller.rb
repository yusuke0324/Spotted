class SpotsController < ApplicationController

  def create
    @spot = Spot.new(spot_params)

    # TODO: Replace placeholder user with current user
    @spot.owner = User.first

    if @spot.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def new
    @spot = Spot.new
  end

  def update
    @spot = Spot.find(params[:id]) #define variable to edit
    p '*'*10
    p params[:spot]
    @spot.assign_attributes(availability: params[:spot][:availability] == 'true') #assign new attributes
    respond_to do |format|
      if @spot.save
        # redirect_to spot_path
        format.js
      else
        redirect_to users_path(current_user)
      end
    end
  end

private



  def spot_params
    params.require(:spot).permit(:address, :price, :end_time, :picture, :picture_cache)
  end

end
