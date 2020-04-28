# Instructions for Evaluating Auctions Escape

## Running the App:
1. Clone the app 
2. bundle install && yarn install
3. rails db:migrate:reset db:seed
4. rails s

- If the app gives any database errors, then quit and run the following sequence of commands (this bug seems to be ironed out in our trial runs):
  + bundle install && yarn install
  + rails active_storage:install
  + rails acts_as_taggable_on_engine:install:migrations
  + rails db:migrate:reset db:seed
  + rails s, and proceed to evaluate the app.

## Seeded users:

User 1:
- Email:johnsmith@email.com
- Password:password
     
User 2:
- Email:janesmith@email.com
- Password:password
