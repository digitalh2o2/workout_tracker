class CreateWorkouts < ActiveRecord::Migration
  def change
  	create_table :workouts do |t|
  		t.string :name
  		t.integer :pounds
  		t.integer :repetitions
  		t.integer :sets
  		t.string :muscle_group
  		t.string :date
  		t.integer :user_id
  	end
  end
end
