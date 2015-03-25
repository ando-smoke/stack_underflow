Stack Underflow
======================

A simple, cheeky model of the popular Stack Overflow programming forum.

Installation
------------

Upon cloning of this project onto your local system, navigate via the
command-line to the project folder and run the included Gemfile. Below
is a list of gems included in the Gemfile grouped by execution environment:

```ruby
TEST / DEVELOPMENT / PRODUCTION:
  rails
  pg
  sass-rails
  uglifier
  coffee-rails
  jquery-rails
  turbolinks
  bcrypt-ruby (version 3.1.5)
  letter-opener
  bootstrap-sass

TEST / DEVELOPMENT:
  rspec-rails
  pry

DEVELOPMENT:
  byebug
  web-console
  spring
  quiet-assets

TEST:
  shoulda-matchers
  capybara
  factory_girl_rails
```

If you want to run the included Gemfile, enter the following statements into
the command line:
```ruby
gem install bundler
bundle
```

Before the application can run, the user must have a version of
a Postgres database installed on their system, and running in an active
session. At the time of creation of this application, Postgres 9.4 was
used. To create the necessary database schema, enter the following Rake
statements into the command line:
```rake
rake db:create
rake db:migrate
rake db:test:prepare
```

At the time of initial creation of this application, Ruby
version 2.1.5 was used along with Ruby on Rails 4.2.0.

Database Schema
-----

The following database schema was used for this application:

```
DATABASES:
  stack_underflow_development
  stack_underflow_test

TABLES:
  users
    id (integer PRIMARY KEY)
    name (varchar)
    email (varchar)
    password_hash (varchar)
    password_salt (varchar)
    created_at (timestamp)
    updated_at (timestamp)

  questions
    id (integer PRIMARY KEY)
    title (varchar)
    content (varchar)
    user_id (integer FOREIGN KEY users REFERENCES users(id))
    created_at (timestamp)
    updated_at (timestamp)

  responses
    id (integer PRIMARY KEY)
    answer (text)
    question_id (integer FOREIGN KEY questions REFERENCES questions(id))
    user_id (integer FOREIGN KEY users REFERENCES users(id))
    created_at (timestamp)
    updated_at (timestamp)
```

Usage
-----

Upon completion of the above steps in the Installation section, open
two separate terminal windows to run active sessions of ```rails server```
and ```postgres```, respectively. Next, open up your preferred web browser
and enter the following address:

```url
localhost:3000/
```

The initial home page displays a welcome page along with buttons
for creating a new user (i.e. "sign up") and signing in with a
preexisting user name and password. Upon successful log in,
the user is then taken to their profile page consisting of all
previously asked questions and a button for adding new questions.
All displayed questions can be clicked upon for detail on the
question as well as a list of all user responses. On this question
detail page, new responses can be added via the appropriate button.
Of note, whenever a new question response is added, a mock
'response notification' email is sent to the question originator.
This functionality is provided by the included ```letter_opener```
gem. Finally, the current user can click on the *Sign Out* button
in the upper right corner of the navbar at any time to log out of
the app.

Of note, on the question detail page, all displayed responses
can be edited or deleted at any time, irrespective of whether
or not the current user and response (or question) originator
are the same. Future revisions to the app may entail either removing
this functionality or conditionally restricting edit/delete privileges
to the response originator if they are also the current user.

Known Bugs
----------

None as of 2015-03-25.

Author
------

Benjamin Herson & Andy Uppendahl

License
-------

MIT license.
