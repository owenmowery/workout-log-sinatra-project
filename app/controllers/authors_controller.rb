class AuthorsController < ApplicationController
    get '/signup' do
        erb :"authors/signup"
    end

    get '/login' do
        erb :"authors/login"
    end

    post '/authors' do
        @author = Author.new(params)

        if @author && @author.save
            #set session id
            session[:user_id] = @author.id
            #redirect
            erb :"journals/index"
        else
            erb :"authors/signup"
        end
        
    end

end