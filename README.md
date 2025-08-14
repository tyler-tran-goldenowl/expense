# Expense - a Ruby on Rails Assignment

A simple expense summary application.


##  General Information

- Ruby version: `ruby 3.1.4`
- Rails version: `rails 7.1.5`
- Node version: `v20.0.0`
- Database: `postgresql`


## Features

- Build expenses summary by month


##  Installation

- Make sure that you have installed ruby, rails, postgresql and nodejs.

- Clone this repo `git clone git@github.com:tyler-tran-goldenowl/expense.git`

- Install correct ruby version for our project: `rbenv local 3.1.4`

- Install bundler: `gem install bundler`

- Install gems: `bundle install`

- Add database config: create `config/database.yml` file (see example file at `config/database.yml.example`)

- Add enviroment file at `.env` ( ask your teammate to get .env )

- Add rails master key at `config/master.key` (ask your team member to get master key)

- Database setup: `bundle exec rake db:setup`

- Run seed data: `bundle exec rake db:seed`

- Start rails server: `rails s`

- Visit `http://localhost:3000` and start coding


##  Rspec

- Run test by `bundle exec rspec`
