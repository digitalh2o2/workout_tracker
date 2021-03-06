require 'rack-flash'

class UsersController < ApplicationController

	get '/signup' do
		if !session[:user_id]
			erb :'/users/create_user'
		else
			redirect to '/workouts' 
		end
	end

	post '/signup' do
		name = params[:name].size
		user = params[:username].size
		password = params[:password].size

		if name < 1 || user < 1 || password < 1
			flash[:message] = "All fields must be filled out."
			redirect '/signup'
		else
			@user = User.create(name: params[:name], username: params[:username], password: params[:password])
			@user.save
			session[:user_id] = @user.id

			flash[:message] = "Successfully created account!"

			redirect to '/workouts'
		end
	end

	get '/login' do
		if !session[:user_id]
			erb :'/users/login'
		else
			redirect to '/workouts'
		end
	end

	post '/login' do
		@user = User.find_by(username: params[:username])
		if @user && @user.authenticate(params[:password])
			@user.save
			session[:user_id] = @user.id

			flash[:message] = "You have successfully logged in"

			redirect to '/workouts'
		else
			flash[:message] = "Username and/or password is invalid. Please try again"
			redirect to '/login'
		end
	end

	get '/logout' do
		session.clear
		redirect to '/'
	end
end