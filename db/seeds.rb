# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

auction1 = Auction.create!(
    title: 'Ford Model T',
    description: 'Antique Ford Modle T',
    starting_bid: '200.00',
    buy_now_price: '2000.00',
    winning_bid: '1700.00',
    expire_date: '20200917',
    status: 'true' 
)

auction2 = Auction.create!(
    title: 'Ford Model F',
    description: 'Ford Modle F, low mileage',
    starting_bid: '200.00',
    buy_now_price: '2000.00',
    winning_bid: '1700.00',
    expire_date: '20200617',
    status: 'true' 
)

auction3 = Auction.create!(
    title: 'Chevy Spark',
    description: 'Slight hail damage',
    starting_bid: '200.00',
    buy_now_price: '1900.00',
    winning_bid: '1700.00',
    expire_date: '20200917',
    status: 'true' 
)
