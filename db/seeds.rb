User.destroy_all
Workout.destroy_all

type = ["Run", "Weightlifting", "HIIT", "Swimming", "Walking"]

5.times do 
    User.create(
        name: Faker::Name.name,
        username: Faker::Name.initials,
        password: "password"
    )
end

15.times do 
    Workout.create(
        date: Faker::Date.between(from: '2021-04-01', to: '2021-04-16'),
        workout_type: type.sample,
        description: Faker::GreekPhilosophers.quote,
        cals_burned: Faker::Number.number(digits: 3),
        length: Faker::Number.number(digits: 2).to_s + " minutes"
    )
end

puts "Complete!"