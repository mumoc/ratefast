# RateFast

Vote for your favorite meals for the whole week!!

## Dummy Data

Here are some user credentials: (user/password)

- Admin: `admin@admin.com / 123qwe123`

- User 1 to 5:  `user#@user.com / 123qwe123`  (eg `user3@user.com`)

## Config

### Env

You'll need your **Github Key** and **Github Secret** from a [new app][].

Go and copy the **.env.example** as **.env** with:

`cp .env.example .env`

And update the values with your keys (the ones in the example are dummy)

Then, go ahead and run

`bundle exec rake db:create; bundle exec rake db:migrate; bundle exec rake db:seed`

[new app]:https://github.com/settings/applications/new
