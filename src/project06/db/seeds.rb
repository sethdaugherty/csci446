# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

roles = Role.create( [
    {:name => "admin"},
    {:name => "member"}
  ])

users = User.create( [
    {:username => "administrator",
     :password => "password",
     :password_confirmation => "password",
     :fname => "Test",
     :lname => "Administrator",
     :email => "admin@example.com",
     :role => roles[0]},
    {:username => "member",
     :password => "password",
     :password_confirmation => "password",
     :fname => "Test",
     :lname => "Member",
     :email => "member@example.com",
     :role => roles[1]}
  ])

games = Game.create( [
    {:title => "Game 1",
     :rating => "amazing",
     :user => users[1]},
    {:title => "Game 2",
     :rating => "amazing",
     :user => users[1]},
    {:title => "Game 3",
     :rating => "amazing",
     :user => users[1]},
    {:title => "Game 4",
     :rating => "amazing",
     :user => users[1]},
    {:title => "Game 5",
     :rating => "amazing",
     :user => users[1]},
    {:title => "Game 6",
     :rating => "amazing",
     :user => users[1]},
    {:title => "Game 7",
     :rating => "amazing",
     :user => users[1]},
    {:title => "Game 8",
     :rating => "amazing",
     :user => users[1]},
    {:title => "Game 9",
     :rating => "amazing",
     :user => users[1]},
    {:title => "Game 10",
     :rating => "amazing",
     :user => users[1]},
    {:title => "Game 11",
     :rating => "good",
     :user => users[0]},
    {:title => "Game 12",
     :rating => "good",
     :user => users[0]},
    {:title => "Game 13",
     :rating => "good",
     :user => users[0]},
    {:title => "Game 14",
     :rating => "good",
     :user => users[0]},
    {:title => "Game 15",
     :rating => "good",
     :user => users[0]},
    {:title => "Game 16",
     :rating => "good",
     :user => users[0]}
  ])
