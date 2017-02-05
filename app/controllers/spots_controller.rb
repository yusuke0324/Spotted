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
  end

private

  def spot_params
    params.require(:spot).permit(:address, :price, :end_time)
  end

end
