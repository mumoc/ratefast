last_voting = Voting.create({ title: 'Breakfast - Nov 2 to 6' })
admin = User.create({ email: 'admin@admin.com', password: '123qwe123', admin: true })

user1 = User.create({ email: 'user1@user.com', password: '123qwe123' })
user2 = User.create({ email: 'user2@user.com', password: '123qwe123' })
user3 = User.create({ email: 'user3@user.com', password: '123qwe123' })
user4 = User.create({ email: 'user4@user.com', password: '123qwe123' })
user5 = User.create({ email: 'user5@user.com', password: '123qwe123' })

burger_image = Image.create({ url: 'http://nationalhomegrantfoundation.com/wp-content/uploads/2015/10/healthfitnessrevolution-com.jpg' })
admin.items.create({ voting: last_voting,
                     title: 'Burger',
                     image: burger_image,
                     special: true,
                     birthday_name: 'Eduardo' })

pancakes_image = Image.create({ url: 'https://timenewsfeed.files.wordpress.com/2013/02/pancakeh.jpg?w=753' })
admin.items.create({ voting: last_voting,
                     title: 'Pancakes',
                     image: pancakes_image,
                     fixed: true })

pizza_image = Image.create({ url: 'http://ffaasstt.swide.com/wp-content/uploads/italian-food-recipes-not-from-italy-pepperoni-pizza.jpg' })
admin.items.create({ voting: last_voting,
                     title: 'Pizza',
                     image: pizza_image })

sushi_image = Image.create({ url: 'http://cdn1.theodysseyonline.com/files/2015/10/15/635804724267986268-1274097319_food-sushi-1920x1080-wallpaper-2254157.jpg' })
user1.items.create({ voting: last_voting,
                     title: 'Sushi',
                     image: sushi_image })

tacos_image = Image.create({ url: 'http://vignette1.wikia.nocookie.net/food-lovers/images/0/00/Tacos-mexican-food-558181_1920_1280.jpg/revision/latest?cb=20130803192029' })
user1.items.create({ voting: last_voting,
                     title: 'Tacos',
                     image: tacos_image })

hotdogs_image = Image.create({ url: 'http://static.in.groupon-content.net/dealarc/img/slider/324/american-food-1.jpg' })
user2.items.create({ voting: last_voting,
                     title: 'Hot Dogs',
                     image: hotdogs_image })

sandwich_image = Image.create({ url: 'http://img.finedininglovers.com/?img=http%3A%2F%2Ffinedininglovers.cdn.crosscast-system.com%2FBlogPost%2FOriginal_4602_StockFood-00389909.jpg&w=1200&h=660&lu=1395919803&ext=.jpg' })
user3.items.create({ voting: last_voting,
                     title: 'Sandwich',
                     image: sandwich_image })

burrito_image = Image.create({ url: 'http://greatwesternfoods.net/images/slideshow/01.jpg' })
user4.items.create({ voting: last_voting,
                     title: 'Burrito',
                     image: burrito_image })

