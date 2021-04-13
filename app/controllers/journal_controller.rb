class JournalController < ApplicationController

    get "/journals" do
        if logged_in?
            @journals = Journal.all
            erb :"journals/index"
        else
            redirect "/login"
        end
    end

    get "/journals/new" do
        if logged_in?
            erb :"journals/new_entry"
        else
            redirect "/login"
        end
    end

    get "/journals/:id" do
        if logged_in?
            @journal = Journal.find_by_id(params[:id])
            erb :"journals/show"
        end
    end

    post "/journals" do
        journal = Journal.new(params)
        journal.user_id = current_user.id 

        if journal.save
            binding.pry
            redirect "journals/#{journal.id}"
        else
            redirect "journals/new"
        end
    end

end