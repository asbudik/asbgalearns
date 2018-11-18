# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


steph = User.create({first_name: "Steph",
        last_name: "Money", email: "steph@mail.com",
        password: "12341234", password_confirmation: "12341234",
        image_url:"https://s3-us-west-1.amazonaws.com/gadashboard/profile-1.jpg"})

adam = User.create({first_name: "Adam",
        last_name: "Budik", email: "adam@mail.com",
        password: "12341234", password_confirmation: "12341234",
        image_url:"https://s3-us-west-1.amazonaws.com/gadashboard/profile-1.jpg"})

austin = User.create({first_name: "Austin",
        last_name: "West", email: "austin@mail.com",
        password: "12341234", password_confirmation: "12341234",
        image_url:"https://s3-us-west-1.amazonaws.com/gadashboard/profile-1.jpg"})

tim = User.create({first_name: "Tim",
        last_name: "Licata", email: "tim@mail.com",
        password: "12341234", password_confirmation: "12341234",
        image_url:"https://s3-us-west-1.amazonaws.com/gadashboard/profile-1.jpg"})

elie = User.create({first_name: "Elie",
        last_name: "Schoppik", email: "elie@mail.com",
        password: "12341234", password_confirmation: "12341234",
        image_url:"https://s3-us-west-1.amazonaws.com/gadashboard/profile-1.jpg"})

del = User.create({first_name: "Del",
        last_name: "Reed", email: "del@mail.com",
        password: "12341234", password_confirmation: "12341234",
        image_url:"https://s3-us-west-1.amazonaws.com/gadashboard/profile-1.jpg"})

anil = User.create({first_name: "Ani",
        last_name: "Brigpal", email: "anil@mail.com",
        password: "12341234", password_confirmation: "12341234",
        image_url:"https://s3-us-west-1.amazonaws.com/gadashboard/profile-1.jpg"})
