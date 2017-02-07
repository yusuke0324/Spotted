class WelcomeController < ApplicationController
	def index
	  @user = current_user
	end

	def team
	end
end