class Workout < ActiveRecord::Base
    belongs_to :user

    validates :date, :workout_type, :description, :length, presence: true 
end