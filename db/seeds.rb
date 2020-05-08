# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User seed data
user1 = User.create!(
    username: 'johnsmith',
    email: 'johnsmith@email.com',
    password: 'password'
)

user2 = User.create!(
    username: 'janesmith',
    email: 'janesmith@email.com',
    password: 'password'
)

user3 = User.create!(
    username: 'alex',
    email: 'alex@email.com',
    password: 'password'
)

user4 = User.create!(
    username: 'bob',
    email: 'bob@email.com',
    password: 'password'
)

# Auction seed data
auction1 = Auction.create!(
    user: user1,
    title: '1996 Chevrolet Beretta',
    description: 'Slight rust on rear panel',
    starting_bid: '200.00',
    buy_now_price: '2000.00',
    expire_date: '2021-10-31',
    :seed_flag => true
)


auction2 = Auction.create!(
    user: user2,
    title: '1998 Dodge Stratus',
    description: 'Rebuilt engine',
    starting_bid: '600.00',
    buy_now_price: '2599.99',
    expire_date: '2020-05-22',
    :seed_flag => true
)

auction3 = Auction.create!(
    user: user2,
    title: '2004 Saturn Vue',
    description: 'Lots of hail damage',
    starting_bid: '200.00',
    buy_now_price: '1900.00',
    expire_date: '2020-09-25',
    :seed_flag => true
)

auction4 = Auction.create!(
    user: user3,
    title: '2003 Honda Civic',
    description: 'Rear screen damage',
    starting_bid: '100.00',
    buy_now_price: '1200.00',
    expire_date: '2020-05-30',
    :seed_flag => true
)
auction5 = Auction.create!(
    user: user4,
    title: '2007 Mazda 6',
    description: 'Front bumber damage',
    starting_bid: '300.00',
    buy_now_price: '2000.00',
    expire_date: '2020-10-21',
    :seed_flag => true
)

Review1 = Review.create!(
    name: 'Corey',
    email: 'Bedell@email.com',
    message: 'Great commmunication!',


)

#bid seeds
bid1 = Bid.create!(
    user: user2,
    amount: 210.21,
    auction: auction1
)

bid2 = Bid.create!(
    user: user1,
    amount: 610.21,
    auction: auction2
)
bid3 = Bid.create!(
    user: user4,
    amount: 620.50,
    auction: auction2
)

auction1.tag_list.add('Chevy',"90s","Coupe")
auction2.tag_list.add('Dodge',"90s","Sedan","Rebuilt Engine")
auction3.tag_list.add('Saturn',"2000s","SUV","Cheap")
auction4.tag_list.add('Mazda',"2007s","Sedan","Cheap")
auction5.tag_list.add('Honda',"2003s","Sedan","Cheap")

auction1.image.attach(io: File.open('app/assets/images/Beretta.jpeg'), filename: 'Beretta.jpeg', content_type: 'application/jpeg')
auction2.image.attach(io: File.open("#{Rails.root}/app/assets/images/Stratus.jpeg"), filename: 'Stratus.jpeg')
auction3.image.attach(io: File.open('app/assets/images/Vue.jpeg'), filename: 'Vue.jpeg')
auction4.image.attach(io: File.open('app/assets/images/mazda6.jpg'), filename: 'mazda6.jpg')
auction5.image.attach(io: File.open('app/assets/images/civic.jpg'), filename: 'civic.jpg')
