class WorkoutsController < ApplicationController

	get '/workouts' do
		if !session[:user_id]
			redirect to '/login'
		else
			@user = User.find(session[:user_id])
			erb :'/workouts/workouts'
		end
	end

	get '/workouts/new' do
		if !session[:user_id]
			redirect to '/login'
		else
			@user = User.find(session[:user_id])
			erb :'/workouts/new_workout'
		end
	end

	post '/workouts' do
		if params[:name].empty? || params[:date].empty?
			flash[:message] = "Workout needs a name and/or date."

			redirect to "/workouts/new"
		else
			@workout = Workout.create(name: params[:name], pounds: params[:pounds], repetitions: params[:repetitions], sets: params[:sets], muscle_group: params[:muscle_group], date: params[:date])
			@workout.user_id = session[:user_id]
			@workout.save

			flash[:message] = "You have logged a new workout!"

			redirect to '/workouts'
		end
	end

	get '/workouts/:id' do
		if !session[:user_id]
			redirect to '/login'
		else
			@workout = Workout.find_by_id(params[:id])
			erb :'/workouts/show_workout'
		end
	end

	get '/workouts/:id/edit' do
		if !session[:user_id]
			redirect to '/login'
		else
			@workout = Workout.find_by_id(params[:id])
			erb :'/workouts/edit_workout'
		end
	end

	patch '/workouts/:id' do
		@workout = Workout.find_by_id(params[:id])
		if	!session[:user_id]
			redirect to '/login'
		elsif
			@workout.name = params[:name]
			@workout.pounds = params[:pounds]
			@workout.repetitions = params[:repetitions]
			@workout.sets = params[:sets]
			@workout.muscle_group = params[:muscle_group]
			@workout.date = params[:date]
			@workout.save

			flash[:message] = "Successfully updated your workout!"
			redirect to '/workouts'
		end			
	end
end