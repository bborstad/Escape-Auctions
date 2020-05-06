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
    amount: 210.21,
    auction: auction2
)

auction1.tag_list.add('Chevy',"90s","Coupe")
auction2.tag_list.add('Dodge',"90s","Sedan","Rebuilt Engine")
auction3.tag_list.add('Saturn',"2000s","SUV","Cheap")

auction1.image.attach(io: File.open('app/assets/images/Beretta.jpeg'), filename: 'Beretta.jpeg', content_type: 'application/jpeg')
auction2.image.attach(io: File.open("#{Rails.root}/app/assets/images/Stratus.jpeg"), filename: 'Stratus.jpeg')
auction3.image.attach(io: File.open('app/assets/images/Vue.jpeg'), filename: 'Vue.jpeg')
