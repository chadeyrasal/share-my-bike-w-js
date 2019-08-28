# README

Share My Bike is a Rails web application, with Facebook authentication and BCrypt password encryption. On Share My Bike you can browse through cities and neighborhoods and view bicycles that are available to rent. The goal is that you rent a bicycle from someone just like yourself in a city or country that you are visiting. This way, you do not pollute, you can easily explore the area you are in, and you get to meet locals when getting your bike!

This JavaScript enhanced version offers the same capabilities but rendered dynamically via JavaScript.

You can read the blog post I wrote about this app <a href="https://medium.com/@annelaure.developer/adding-javascript-features-to-a-rails-web-application-14fb281a1ba1?sk=49bd84344661c0d73a7c176309e89ac2">here</a>


# Installation

First of all, you should clone the repository locally

```
$ git clone git@github.com:chadeyrasal/share-my-bike-w-js.git
$ cd share-my-bike-w-js
```

Then install the project's dependencies by running bundle

```
$ bundle install
```

After that, populate the database by running the seeds file. Make sure to create passwords for the users listed in the file.

```
$ rake db:seed
```

And finally start the app by starting the Rails server and visit http://localhost:3000/

```
$ rails s
```


# Contributing

Bug reports and pull requests are welcome on GitHub on <a href="https://github.com/chadeyrasal/share-my-bike-2">this repo</a>


# License

The application is available as open source under the terms of the <a href="https://opensource.org/licenses/MIT">MIT License</a>
