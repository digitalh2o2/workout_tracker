### Workout Tracker ###
I've built a basic workout tracker so that you are able to create, update and delete any workout that you perform at the gym. I plan on porting this to Rails in the future but wanted to have a foundation in place so that one can start tracking their data in the meantime. 

Please fork and clone this repository and `cd` into the directory. Once inside run `bundle install`, followed by `shotgun` and visit the address provided by `shotgun` which typically is `127.0.0.1:9393`. If successful, you'll be greeted by the Workout Tracker welcome page and can create an account to begin. Enjoy!

Directory structure is as followed: 
```
|__app
|	|__controllers
|	|	|__application_controller.rb
|	|	|__users_controller.rb
|	|	|__workouts_controller.rb
|	|__models
|	|	|__user.rb
|	|	|__workout.rb
|	|__views
|		|__users
|		|	|__create_user.rb
|		|	|__login.erb
|		|__workouts
|		|	|__edit_workout.erb
|		|	|__new_workout.erb
|		|	|__show_workout.erb
|		|	|__workouts.erb
|		|__layout.erb
|		|__welcome.erb
|
|__config
|	|__initializers
|	|__environment.rb
|__db
|	|__migrate
|			
|__lib
|__public
|	|__images
|	|__javascripts
|	|__stylesheets
|		|__main.css
|__spec
|	|__application_controller_spec.rb
|__Gemfile
|__README.md
|__Rakefile
|__config.ru
```