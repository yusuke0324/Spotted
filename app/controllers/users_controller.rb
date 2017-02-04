class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@spots = @user.spots
	end
end