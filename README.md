# Instructions for Evaluating Auctions Escape
- Attempt running the app using the standard rails s command, and then proceed to evaluating.
- If the app does not seem to be functioning properly, then quit and run the following sequence of commands:
  1. bundle install && yarn install
  2. rails active_storage:install
  3. rails acts_as_taggable_on_engine:install:migrations
  4. rails db:migrate:reset db:seed
  5. rails s, and proceed to evaluate the app.

# Provided users:
  1. Email:johnsmith@email.com
     Password:password
  1. Email:janesmith@email.com
     Password:password
