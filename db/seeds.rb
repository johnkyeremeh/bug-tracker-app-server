# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# With Projects.

# user1 = User.create(username: "Paul", password: "password", email: "test1@email.com")
# user2 = User.create(username: "Wall", password: "password", email: "test2@email.com")
# user3 = User.create(username: "Call", password: "password", email: "test3@email.com")

# project1 = Project.create(title: "App", description: " App ", user: user1)
# project2 = Project.create(title: "Mobile", description: "New Mobile Design", user: user1)
# project3 = Project.create(title: "Desktop", description: "Desktop", user: user1)


# bug1 = Bug.create(title: "Mobile View Broken", description: "Sample Description", user: user1, project: project1, status: "Open", priority: "Low")
# bug2 = Bug.create(title: "Mobile  ", description: "sdfdsfdsfdsfs f sdf", user: user1, project: project1, status: "Open", priority: "Medium")
# bug3 = Bug.create(title: "Msadsan", description: "Tdsfdsfdsfdes dsfdsfdsfdt", user: user1, project: project1, status: "Open", priority: "High")


# Without Projects.


user1 = User.create(username: "Paul", password: "password", email: "test1@email.com")
user2 = User.create(username: "Wall", password: "password", email: "test2@email.com")
user3 = User.create(username: "Call", password: "password", email: "test3@email.com")

# project1 = Project.create(title: "App", description: " App ", user: user1)
# project2 = Project.create(title: "Mobile", description: "New Mobile Design", user: user1)
# project3 = Project.create(title: "Desktop", description: "Desktop", user: user1)


bug1 = Bug.create(title: "Mobile View Broken", description: "Sample Description", user: user1,  status: "Open", priority: "Low")
bug2 = Bug.create(title: "Mobile  ", description: "sdfdsfdsfdsfs f sdf", user: user1,  status: "Open", priority: "Medium")
bug3 = Bug.create(title: "Msadsan", description: "Tdsfdsfdsfdes dsfdsfdsfdt", user: user1,  status: "Open", priority: "High")
