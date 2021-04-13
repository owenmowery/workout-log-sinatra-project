class UserController < ApplicationController
    get '/signup' do
        erb :"users/signup"
    end

    post '/signup' do
        @user = User.new(params)

        if @user && @user.save
            #set session id
            session[:user_id] = @user.id
            #redirect
            erb :"workouts/index"
        else
            erb :"users/signup"
        end
    end
end