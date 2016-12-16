[![Build Status](https://travis-ci.org/conorburke/HaulrRails.svg?branch=master)](https://travis-ci.org/conorburke/HaulrRails)

# Introduction

Haulr helps people move stuff quickly and cheaply. Users can input their location and the size and quantity of items, and a driver arrives within minutes to move the item to a new location.

### Install

Haulr requires [Ruby 2.3.1](https://www.ruby-lang.org/en/documentation/installation/) and [Rails 5.0.0](http://guides.rubyonrails.org/getting_started.html).

Once Ruby on Rails is configured, install all gem dependencies: 

```
bundle install
```

Create, migrate, and seed the database:

```
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
```

### Usage

Run the rails server and navigate to the provided localhost port in your browser:

```
rails server
```

Run the test suite:

```
bundle exec rspec
```

### Deployment instructions

...deployment instructions go here...

### Team

Haulr was designed and developed by a team of 4 as a final project at Dev Bootcamp in San Diego.
* Patrick Anderson
* Conor Burke
* Kelsey Edelstein
* Chelsea Lin

### License

This project is licensed under the terms of the MIT license.
