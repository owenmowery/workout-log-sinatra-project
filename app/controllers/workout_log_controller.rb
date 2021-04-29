class WorkoutLogController < ApplicationController

    get "/workouts" do
        if logged_in?
            @workouts = Workout.all
            erb :"workouts/index"
        else
            redirect "/login"
        end
    end

    get "/workouts/new" do
        if logged_in?
            erb :"workouts/new_entry"
        else
            redirect "/login"
        end
    end

    get "/workouts/mine" do
        @workouts = current_user.workouts
        erb :"workouts/index"
    end

    get "/workouts/:id" do
        if @workout = Workout.find_by_id(params[:id])    
            erb :"workouts/show"
        else
            redirect "/workouts"
        end
    end

    get "/workouts/:id/edit" do
        if logged_in?
            @workout = Workout.find_by_id(params[:id])
            if @workout.user_id != session[:user_id] || @workout.user_id == nil
                redirect "/workouts"
            else
                erb :"workouts/edit"
            end
        else
            redirect "/login"
        end 
    end

    post "/workouts/new" do
        @workout = Workout.new(params)
        @workout.user_id = session[:user_id]
        if @workout.save
            redirect "workouts/#{@workout.id}"
        else
            redirect "workouts/new"
        end
    end

    patch "/workouts/:id/edit" do
        @workout = Workout.find_by_id(params[:id])
        if @workout == nil || @workout.user_id != session[:user_id] || @workout.user_id == nil
            redirect "/workouts"
        end
        params.delete("_method")
        if @workout.update(params)
            redirect "/workouts/#{@workout.id}"
        else
            redirect "workouts/new"
        end
    end

    delete "/workouts/:id" do
        workout = Workout.find_by_id(params[:id])
        if workout.user_id == session[:user_id] 
            workout.destroy
            redirect "/workouts"
        else
            redirect "/workouts"
        end

    end


end