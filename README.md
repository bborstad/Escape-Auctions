# Instructions for Evaluating Auctions Escape
1. Clone the app 
2. **Run:** bundle install && yarn install
3. **Run:** rails db:migrate:reset db:seed
4. **Run:** rails s

- If the app gives any database errors, then quit and run the following sequence of commands:
  1. bundle install && yarn install
  2. rails active_storage:install
  3. rails acts_as_taggable_on_engine:install:migrations
  4. rails db:migrate:reset db:seed
  5. rails s, and proceed to evaluate the app.

# Seeded users:
  1. Email:johnsmith@email.com
     Password:password
  1. Email:janesmith@email.com
     Password:password
