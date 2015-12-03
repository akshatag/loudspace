class SessionsController < ApplicationController

	# renders sign in page
	def new
		render :new
	end

	def create
		user = User.find_by email: "#{params[:email]}"
		if !user.nil?
			validate_sign_in(user, params)
		else
			redirect_to '/signin'
		end
	end

	def destroy
		reset_session
		redirect_to '/'
	end

	def validate_sign_in(user, params)
		if user.password == params[:password]
			session[:user_id] = user.id

			redirect_to user
		else
			redirect_to '/signin'
		end
	end
end
