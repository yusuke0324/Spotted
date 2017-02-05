class SpotsController < ApplicationController

  # before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

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

  def edit
    @spot = Spot.find(params[:id])
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def update
    
    @spot = Spot.find(params[:id]) #define variable to edit

    @spot.assign_attributes(params[:spot]) #assign new attributes

    if @spot.save 
      redirect_to spot_path
    else
      render 'edit'
    end

  end

private

  def spot_params
    params.require(:spot).permit(:address, :price, :end_time)
  end

  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end

end
