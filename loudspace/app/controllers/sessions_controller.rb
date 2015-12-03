class SessionsController < ApplicationController

	# renders sign in page
	def new
		@user = User.new
	end

	def create
		@user = User.new(:name => "name", :email => params[:email], :password_h => params[:password]);		
		if @user.invalid?
			render :new
			return
		end

		user = User.find_by email: params[:email]

		if !user.nil?
			if user.password == params[:password]
				session[:user_id] = user.id
				redirect_to user
			else
				@user.errors[:match] = "Username and Password don't match"
				render :new
			end
		else
			@user.errors[:exists] = "Username does not exist!"
			render :new
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
