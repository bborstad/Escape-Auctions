# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User seed data
user1 = User.create!(
    username: 'johnsmith'
    password: 'password'
)

user2 = User.create!(
    username: 'janesmith'
    password: 'password'
)

# Auction seed data
auction1 = Auction.create!(
    user: user1,
    title: 'Ford Model T',
    description: 'Antique Ford Modle T',
    starting_bid: '200.00',
    buy_now_price: '2000.00',
    winning_bid: '1700.00',
    expire_date: '20200917',
    status: 'true' 
)

auction2 = Auction.create!(
    user: user2,
    title: 'Ford Model F',
    description: 'Ford Modle F, low mileage',
    starting_bid: '200.00',
    buy_now_price: '2000.00',
    winning_bid: '1700.00',
    expire_date: '20200617',
    status: 'true' 
)

auction3 = Auction.create!(
    user: user2,
    title: 'Chevy Spark',
    description: 'Slight hail damage',
    starting_bid: '200.00',
    buy_now_price: '1900.00',
    winning_bid: '1700.00',
    expire_date: '20200917',
    status: 'true' 
)


