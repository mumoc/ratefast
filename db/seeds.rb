last_voting = Voting.create({ title: 'Breakfast - Nov 2 to 6' })
admin = User.create({ email: 'admin@admin.com', password: '123qwe123', admin: true })

user1 = User.create({ email: 'user1@user.com', password: '123qwe123' })
user2 = User.create({ email: 'user2@user.com', password: '123qwe123' })
user3 = User.create({ email: 'user3@user.com', password: '123qwe123' })
user4 = User.create({ email: 'user4@user.com', password: '123qwe123' })
user5 = User.create({ email: 'user5@user.com', password: '123qwe123' })

burger_image = Image.create({ url: 'http://clv.h-cdn.co/assets/cm/15/08/54ea7ae36c1eb_-_all-american-burger-xl.jpg' })
admin.items.create({ voting: last_voting,
                     title: 'Burger',
                     image: burger_image,
                     special: true,
                     birthday_name: 'Eduardo' })

pancakes_image = Image.create({ url: 'http://xobakingco.com/wp-content/uploads/2013/07/PancakeSyrup_lz.jpg' })
admin.items.create({ voting: last_voting,
                     title: 'Pancakes',
                     image: pancakes_image,
                     fixed: true })

pizza_image = Image.create({ url: 'http://consumerrecipe.conagrafoods.com/uploadedImages/img_6852_5855.jpg' })
admin.items.create({ voting: last_voting,
                     title: 'Pizza',
                     image: pizza_image })

sushi_image = Image.create({ url: 'http://img2.timeinc.net/health/images/slides/add-crunch-sushi-400x400.jpg' })
user1.items.create({ voting: last_voting,
                     title: 'Sushi',
                     image: sushi_image })

tacos_image = Image.create({ url: 'http://cookdiary.net/wp-content/uploads/images/Beef-Tacos_6437.jpg' })
user1.items.create({ voting: last_voting,
                     title: 'Tacos',
                     image: tacos_image })

hotdogs_image = Image.create({ url: 'http://www.landolakes.com/assets/images/recipe/orig/15460.jpg' })
user2.items.create({ voting: last_voting,
                     title: 'Hot Dogs',
                     image: hotdogs_image })

sandwich_image = Image.create({ url: 'http://www.landolakes.com/assets/images/recipe/orig/13536.jpg' })
user3.items.create({ voting: last_voting,
                     title: 'Sandwich',
                     image: sandwich_image })

burrito_image = Image.create({ url: 'http://s3-media1.ak.yelpcdn.com/bphoto/wfz8uj6N33TEDbXfbs8V_Q/l.jpg' })
user4.items.create({ voting: last_voting,
                     title: 'Burrito',
                     image: burrito_image })

