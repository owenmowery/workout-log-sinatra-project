class WorkoutLogController < ApplicationController

    get "/workouts" do
        if logged_in?
            @workouts = Workout.all
            erb :"workouts/index"
        else
            redirect "sessions/login"
        end
    end

    get "/workouts/new" do
        if logged_in?
            erb :"workouts/new_entry"
        else
            redirect "sessions/login"
        end
    end

    get "/workouts/:id" do
        if logged_in?
            @workout = Workout.find_by_id(params[:id])
            
            erb :"workouts/show"
        end
    end

    post "/workouts/new" do
        workout = Workout.new(params)
        workout.user_id = current_user.id 

        if workout.save
            redirect "workouts/#{workout.id}"
        else
            redirect "workouts/new"
        end
    end

end