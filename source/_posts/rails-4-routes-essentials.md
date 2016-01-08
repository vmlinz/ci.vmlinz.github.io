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

In this article, I'm going to take you a tour around the first part of the rails 4 router.

# Content #

## rake command to check routes ##

`rake routes` will show you the list of your routes.

## URL and controller action mapping ##

when you received request for URL:
	GET /patients/17

it will ask the router to match it to a controller action. If the matching route is:
	get '/patients/:id', to: 'patients#show'

then the request is dispatched to the patients controller's `show` action with { id: '17'} in `params`

## Resourceful(restful) routing ##

Resource routing is a shortcut to declare all the common routes for a given resourceful controller, including `index`, `show`, `new`, `edit`, `create`, `update` and `destroy` actions.

### CRUD and restful ###

A single entry in the routes.rb, such as: `resources :users`

creates seven different routes in your application, all mapping to the Photos controller:

|Prefix|Verb|URI Pattern|Controller#Action|
|------|----|-----------|------------------|
|users    |GET     |/users(.:format)          |users#index|
|         |POST    |/users(.:format)          |users#create|
| new_user| GET    |/users/new(.:format)      |users#new|
|edit_user| GET    |/users/:id/edit(.:format) |users#edit|
|     user| GET    |/users/:id(.:format)      |users#show|
|         | PATCH  |/users/:id(.:format)      |users#update|
|         | PUT    |/users/:id(.:format)      |users#update|
|         | DELETE |/users/:id(.:format)      |users#destroy|

* NOTE: there is a singular resource: `resources :user` and in this case you refer to only one resource and don't need to identify different resources of it.

### path and URL helpers ###

The resourceful routes also expose a number of helpers to the controllers, in case of `resources :users`:

* `users_path` returns `/users`
* `new_user_path` returns `/users/new`
* `edit_user_path(:id)` returns `/users/:id/edit`
* `user_path(:id)` returns `/users/:id`

There are helpers with postfix `_url` will return the same path prefixed with current host, port and path.

### namespace and scope ###

#### namespace ###

You can use namespace in resources to group a set of controllers under a namespace. Such as:

* Group controllers under an `Admin::` namespace
* Place controllers under `app/controllers/admin`

Then you can declare route as:


```
namespace :admin do
	resources :articles, :comments
end
```

And all the urls of the controllers will be prefixed with `/admin`

#### scope ####

You can use scope when you want to route `/admin/articles` to ArticlesController instead of Admin::ArticlesController.


```
scope '/admin' do
  resources :articles, :comments
end
```

or

```
resources :articles, path: '/admin/articles'
```

### nested routes ###

Nested routes allow you to represent resources that are logically children of other resources.

### adding more restful actions ###

## Non-resourceful routing ##

In case of URLs which are not fit into resourceful abstraction, rails supports routing for arbitrary URLs.

for models:

```
class Magazine < ActiveRecord::Base
  has_many :ads
end
 
class Ad < ActiveRecord::Base
  belongs_to :magazine
end
```

you can declare the routes:

```
resources :magazines do
  resources :ads
end
```

_NOTE_: Resources should never be nested more than 1 level deep.


#### Shallow nesting

Shallow nesting will help you to generate collection actions scoped under the parent, but leave the member actions as they were. You can avoid deep nesting using this technique.

```
resources :articles do
  resources :comments, only: [:index, :new, :create]
end
resources :comments, only: [:show, :edit, :update, :destroy]
```

and shorthand for the above:

```
resources :articles do
  resources :comments, shallow: true
end
```

# Conclusion #

* Rails router can help you connect URLs to controller actions
* Resource routing can help you describe restful controllers
* Rails router will generate helper functions to help you deal with urls and paths.

# Referrences #

* [rails routes](http://guides.rubyonrails.org/routing.html)
* [rails routes wiki books](https://en.wikibooks.org/wiki/Ruby_on_Rails/Routing)
* [rails routes walk through](http://railscasts.com/episodes/231-routing-walkthrough)
* [rails routing](http://www.theodinproject.com/ruby-on-rails/routing)
* [rails routes cheat sheet](http://ricostacruz.com/cheatsheets/rails-routes.html)
