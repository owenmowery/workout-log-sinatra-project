class SessionsController < ApplicationController
    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do
        #find user
        @author = Author.find_by(username: params[:username])
      
        if @author && @author.authenticate(params[:password])
            session[:user_id] = @author.id

            redirect "/journals"
        else
            redirect "/login"
        end
    end

end