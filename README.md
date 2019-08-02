# Ruby on Rails Members Only app

This is the Members Only application for the Microverse Main Curriculum

## Authors
Bernanrdo Garza - bernardo.g.landa@gmail.com

Kalib Hackin - naguihw@gmail.com


## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, create an user on the console:

```
$ rails console
$ user = User.new(name:"Your name", email:"your@email.com", password:"your_password", password_confirmation:"your_password")
$ user.save

```

Once you created a user you can start the server to view the app:

```
$ rails server
```
