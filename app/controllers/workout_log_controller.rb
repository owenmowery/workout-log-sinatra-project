class WorkoutLogController < ApplicationController

    get "/workouts" do
        if logged_in?
            @workouts = Workout.all
            erb :"workouts/index"
        else
            redirect "/sessions/login"
        end
    end

    get "/workouts/new" do
        if logged_in?
            erb :"workouts/new_entry"
        else
            redirect "/sessions/login"
        end
    end

    get "/workouts/:id" do
        if logged_in?
            @workout = Workout.find_by_id(params[:id])    
            erb :"workouts/show"
        else
            redirect "/sessions/login"
        end
    end

    get "/workouts/:id/edit" do
        if logged_in?
            @workout = Workout.find_by_id(params[:id])
            if @workout.user_id != logged_in? || @workout.user_id == nil
                redirect "/workouts"
            else
                erb :"workouts/edit"
            end
        else
            redirect "/sessions/login"
        end 
    end

    post "/workouts/:id/edit" do
        @workout = Workout.find_by_id(params[:id])
        @workout.update(params)

        if @workout.update(params)
            redirect "/workouts/#{@workout.id}"
        else
            redirect "workouts/new"
        end
    end

    post "/workouts/new" do
        @workout = Workout.new(params)
        @workout.user_id = logged_in?
        if @workout.save
            redirect "workouts/#{@workout.id}"
        else
            redirect "workouts/new"
        end
    end

    post "/workouts/:id" do
        workout = Workout.find_by_id(params[:id])
        if workout.user_id == logged_in? 
            workout.destroy
            redirect "/workouts"
        else
            redirect "/workouts"
        end

    end


end