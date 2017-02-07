class WelcomeController < ApplicationController
	def index
	  @user = current_user
	end

	def team
	  @user = current_user
	end
end