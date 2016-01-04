title: Rails 4 routes essentials, part I
date: 2016-01-04 20:01:59
tags:
	- ruby
	- rails
	- routes
---

# Introduction #

The purposes of rails router are:

* recognize the URLs
* dispatch URLs to the controller actions
* generate helper functions to avoid hard coding URLs in the view
* helpers to generate restful routes
* many other useful functions to help you dealing with routing

In this article, I'm going to take you a tour around the rails 4 router.

# content #

## rake command to check routes

## URL and controller action mapping

## Resourceful(restful) routing

### default routes for the resource routing

### CRUD and restful

### path and URL helpers

### namespaced routes

### nested routes

### adding more restful actions

## Non-resourceful routing

In case of URLs which are not fit into resourceful abstraction, rails supports routing for arbitrary URLs.

### bound parameters

### static segments

### defining defaults

### naming routes

### http verb constraints

### segment constraints

### request based constraints

### advanced constraints

### routing to a rack application

# referrences#

* [rails routes](http://guides.rubyonrails.org/routing.html)
* [rails routes wiki books](https://en.wikibooks.org/wiki/Ruby_on_Rails/Routing)
* [rails routes walk through](http://railscasts.com/episodes/231-routing-walkthrough)
* [rails routing](http://www.theodinproject.com/ruby-on-rails/routing)
* [rails routes cheat sheet](http://ricostacruz.com/cheatsheets/rails-routes.html)
