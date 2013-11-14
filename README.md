Hacker New Clone
================
This is a social news web-based app that provides a service similar to Hacker News.  A registered user can post, comment and vote on a link and share it with others.  To run this program, open a terminal and do the following:

* run `$ bundle` to install the necessary Gems
* run `$ rake db:create` to create your database
* run `$ rake db:schema:load` to load the database schema
* run `$ rails s` to initialize your sever and to start the app
* navigate your browser to http://localhost:3000/

This app is written with Ruby on Rails, Active Record, PostgreSQL, will_paginate and Bootstrap and tested with Rspec and Capybara.  I used polymorphism to implement comments so that a comment can belong to a post or to another comment.
