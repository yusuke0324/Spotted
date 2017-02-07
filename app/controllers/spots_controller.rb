class SpotsController < ApplicationController

  def show
    @spot = Spot.find(params[:id])
  end

  def create
    @spot = Spot.new(spot_params)

    @spot.owner = current_user

    if @spot.save
      redirect_to user_path(current_user.id)
    else
      render 'new'
    end
  end

  def new
    @user = current_user
    @spot = Spot.new
  end

  def update
    p params
    @spot = Spot.find(params[:id]) #define variable to edit

    if params[:spot][:availability]
      @spot.assign_attributes(availability: params[:spot][:availability] == 'true') #assign new attributes
    else
      p '*' * 10
      p params[:spot][:end_time]
      p '*' * 10
      p DateTime.strptime(params[:spot][:end_time], '%m/%d/%Y %H:%M %p')
      @spot.assign_attributes(price: params[:spot][:price], end_time: DateTime.strptime(params[:spot][:end_time], '%m/%d/%Y %H:%M %p'))
    end
    p @spot
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
