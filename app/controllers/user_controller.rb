class UserController < ApplicationController
    get '/signup' do
        erb :"users/signup"
    end

    post '/signup' do
        @user = User.new(params)
        @workouts = Workout.all
        if @user && @user.save
            #set session id
            session[:user_id] = @user.id
            #redirect
            redirect "/workouts"
        else
            redirect "/signup"
        end
    end
end