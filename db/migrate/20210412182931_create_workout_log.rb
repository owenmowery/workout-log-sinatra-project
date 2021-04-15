class CreateWorkoutLog < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.string :date
      t.string :workout_type
      t.string :description
      t.integer :cals_burned
      t.string :length
      t.integer :user_id
    end
  end
end
