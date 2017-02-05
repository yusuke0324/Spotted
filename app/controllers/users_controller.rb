class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		if request.xhr?
			p params[:test]
			p params[:latitude]
			p params[:longitude]
		end
	end
end